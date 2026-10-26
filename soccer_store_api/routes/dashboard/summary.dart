import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {
      'success': true,
      'summary': {
        'totalSales': 15000,
        'activeOrders': 25,
        'topProduct': 'Professional Soccer Ball',
      },
    },
  );
}
