import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/database.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final db = await MongoDatabase.connection;
  final customer = await db.collection('customers').findOne(where.id(ObjectId.fromHexString(id)));
  if (customer == null) {
    return Response.json(statusCode: 404, body: {'success': false, 'message': 'Customer not found'});
  }
  return Response.json(body: {'success': true, 'customer': customer});
}
