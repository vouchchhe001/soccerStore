import 'package:dart_frog/dart_frog.dart';
import 'package:soccer_store_api/services/product_service.dart';

final productService = ProductService();

Future<Response> onRequest(RequestContext context, String id) async {
  final product = await productService.getProductById(id);
  if (product == null) {
    return Response.json(statusCode: 404, body: {'success': false, 'message': 'Product not found'});
  }
  return Response.json(body: {'success': true, 'product': product});
}
