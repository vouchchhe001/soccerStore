import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/providers/store_provider.dart';

final storeProvider = StoreProvider();

Future<Response> onRequest(RequestContext context) async {
  final path = context.request.url.path;
  final method = context.request.method;

  if (method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'success': false, 'message': 'Method not allowed'});
  }

  if (path == '/brands') {
    return Response.json(body: storeProvider.brands.map((b) => b.toJson()).toList());
  }
  if (path.startsWith('/brands/')) {
    try {
      final id = path.split('/').last;
      final brand = storeProvider.getById(storeProvider.brands, id, (b) => b.id);
      return Response.json(body: brand.toJson());
    } catch (_) {
      return Response.json(statusCode: 404, body: {'success': false, 'message': 'Brand not found'});
    }
  }

  return Response.json(statusCode: 404, body: {'success': false, 'message': 'Not Found'});
}
