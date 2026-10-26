import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/providers/store_provider.dart';

final storeProvider = StoreProvider();

Future<Response> onRequest(RequestContext context) async {
  final path = context.request.url.path;
  final method = context.request.method;

  if (method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'success': false, 'message': 'Method not allowed'});
  }

  if (path == '/suppliers') {
    return Response.json(body: storeProvider.suppliers.map((s) => s.toJson()).toList());
  }
  if (path.startsWith('/suppliers/')) {
    try {
      final id = path.split('/').last;
      final supplier = storeProvider.getById(storeProvider.suppliers, id, (s) => s.id);
      return Response.json(body: supplier.toJson());
    } catch (_) {
      return Response.json(statusCode: 404, body: {'success': false, 'message': 'Supplier not found'});
    }
  }

  return Response.json(statusCode: 404, body: {'success': false, 'message': 'Not Found'});
}
