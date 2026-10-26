import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = await MongoDatabase.connection;
  final brands = await db.collection('brands').find().toList();
  return Response.json(body: {'success': true, 'brands': brands});
}
