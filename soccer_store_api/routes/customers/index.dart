import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = await MongoDatabase.connection;
  final customers = await db.collection('customers').find().toList();
  return Response.json(body: {'success': true, 'customers': customers});
}
