import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/database.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.get) {
    return _handleGet(context);
  } else if (method == HttpMethod.post) {
    return _handlePost(context);
  }

  return Response.json(
    statusCode: 405,
    body: {'success': false, 'message': 'Method not allowed'},
  );
}

Future<Response> _handleGet(RequestContext context) async {
  try {
    final db = await MongoDatabase.connection;
    final collection = db.collection('payments');

    // Optional: Filter by orderId if provided in query parameters
    final queryParams = context.request.uri.queryParameters;
    final orderId = queryParams['orderId'];

    final selector = orderId != null ? where.eq('orderId', orderId) : where;
    final documents = await collection.find(selector).toList();

    final payments = documents.map((doc) {
      final payment = Map<String, dynamic>.from(doc);
      payment.remove('_id');
      return payment;
    }).toList();

    return Response.json(
      body: {
        'success': true,
        'count': payments.length,
        'payments': payments,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'success': false, 'message': 'Failed to retrieve payments'},
    );
  }
}

Future<Response> _handlePost(RequestContext context) async {
  try {
    final body = await context.request.json();

    if (body == null) {
      return Response.json(
        statusCode: 400,
        body: {'success': false, 'message': 'Request body is required'},
      );
    }

    // Basic Validation
    final orderId = body['orderId'];
    final amount = body['amount'];
    final paymentMethod = body['paymentMethod'];

    if (orderId == null || amount == null || paymentMethod == null) {
      return Response.json(
        statusCode: 400,
        body: {
          'success': false,
          'message':
              'Missing required fields: orderId, amount, or paymentMethod',
        },
      );
    }

    final db = await MongoDatabase.connection;
    final collection = db.collection('payments');

    final paymentData = {
      'orderId': orderId,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'status': 'completed',
      'createdAt': DateTime.now().toIso8601String(),
    };

    await collection.insertOne(paymentData);

    return Response.json(
      statusCode: 201,
      body: {
        'success': true,
        'message': 'Payment recorded successfully',
        'payment': paymentData,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'success': false, 'message': 'Failed to process payment'},
    );
  }
}
