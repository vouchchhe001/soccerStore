import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/services/order_service.dart';

final orderService = OrderService();

Future<Response> onRequest(RequestContext context, String id) async {
  final order = await orderService.getOrderById(id);
  if (order == null) {
    return Response.json(statusCode: 404, body: {'success': false, 'message': 'Order not found'});
  }
  return Response.json(body: {'success': true, 'order': order});
}
