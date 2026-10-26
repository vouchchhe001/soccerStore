import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/providers/store_provider.dart';

final storeProvider = StoreProvider();

Future<Response> onRequest(RequestContext context) async {
  final path = context.request.url.path;
  final method = context.request.method;

  if (method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'success': false, 'message': 'Method not allowed'});
  }

  if (path == '/orders') {
    return Response.json(body: storeProvider.orders.map((o) => o.toJson()).toList());
  }
  if (path.startsWith('/orders/')) {
    try {
      final id = path.split('/').last;
      final order = storeProvider.getById(storeProvider.orders, id, (o) => o.id);
      return Response.json(body: order.toJson());
    } catch (_) {
      return Response.json(statusCode: 404, body: {'success': false, 'message': 'Order not found'});
    }
  }

  return Response.json(statusCode: 404, body: {'success': false, 'message': 'Not Found'});
}
