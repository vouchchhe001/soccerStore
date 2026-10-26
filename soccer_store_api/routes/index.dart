import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response.json(
      statusCode: 405,
      body: {'success': false, 'message': 'Method not allowed'},
    );
  }

  try {
    final db = await MongoDatabase.connection;
    final collection = db.collection('customers');

    final documents = await collection.find().toList();

    final customers = documents.map((doc) {
      final customer = Map<String, dynamic>.from(doc);
      customer.remove('_id');
      return customer;
    }).toList();

    return Response.json(
      body: {
        'success': true,
        'count': customers.length,
        'customers': customers,
      },
    );
  } catch (e) {
    print('Customers API error: $e');

    return Response.json(
      statusCode: 500,
      body: {'success': false, 'message': 'Failed to get customers'},
    );
  }
}
