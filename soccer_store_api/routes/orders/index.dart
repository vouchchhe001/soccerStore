import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/services/order_service.dart';

final orderService = OrderService();

Future<Response> onRequest(RequestContext context) async {
  final orders = await orderService.getAllOrders();
  return Response.json(body: {'success': true, 'orders': orders});
}
