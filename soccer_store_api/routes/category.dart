import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/providers/store_provider.dart';

final storeProvider = StoreProvider();

Future<Response> onRequest(RequestContext context) async {
  final path = context.request.url.path;
  final method = context.request.method;

  if (method != HttpMethod.get) {
    return Response.json(
      statusCode: 405,
      body: {'success': false, 'message': 'Method not allowed'},
    );
  }

  if (path == '/categories') {
    return Response.json(
      body: storeProvider.categories.map((c) => c.toJson()).toList(),
    );
  }
  if (path.startsWith('/categories/')) {
    try {
      final id = path.split('/').last;
      final category = storeProvider.getById(
        storeProvider.categories,
        id,
        (c) => c.id,
      );
      return Response.json(body: category.toJson());
    } catch (_) {
      return Response.json(
        statusCode: 404,
        body: {'success': false, 'message': 'Category not found'},
      );
    }
  }

  return Response.json(
    statusCode: 404,
    body: {'success': false, 'message': 'Not Found'},
  );
}
