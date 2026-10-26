import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/services/product_service.dart';

final productService = ProductService();

Future<Response> onRequest(RequestContext context) async {
  final products = await productService.getAllProducts();
  return Response.json(body: {'success': true, 'products': products});
}
