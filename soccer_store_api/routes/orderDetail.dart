import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/providers/store_provider.dart';

final storeProvider = StoreProvider();

Future<Response> onRequest(RequestContext context) async {
  final path = context.request.url.path;
  final method = context.request.method;

  if (method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'success': false, 'message': 'Method not allowed'});
  }

  if (path == '/orderDetails') {
    return Response.json(body: storeProvider.orderDetails.map((od) => od.toJson()).toList());
  }
  if (path.startsWith('/orderDetails/')) {
    try {
      final id = path.split('/').last;
      final detail = storeProvider.getById(storeProvider.orderDetails, id, (od) => od.id);
      return Response.json(body: detail.toJson());
    } catch (_) {
      return Response.json(statusCode: 404, body: {'success': false, 'message': 'Order detail not found'});
    }
  }

  return Response.json(statusCode: 404, body: {'success': false, 'message': 'Not Found'});
}
