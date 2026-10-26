import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {'success': true, 'message': 'Login successful', 'token': 'valid-token-123'},
  );
}
