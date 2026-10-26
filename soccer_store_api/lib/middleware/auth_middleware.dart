import 'package:dart_frog/dart_frog.dart';

Handler authMiddleware = handler((context) async {
  final request = context.request;
  final authHeader = request.headers['Authorization'];

  if (authHeader == null || !authHeader.startsWith('Bearer ')) {
    return Response.json(
      statusCode: 401,
      body: {'success': false, 'message': 'Unauthorized: Missing or invalid token'},
    );
  }

  // In a real app, you would validate the JWT token here
  final token = authHeader.substring(7);
  if (token != 'valid-token-123') {
    return Response.json(
      statusCode: 401,
      body: {'success': false, 'message': 'Unauthorized: Invalid token'},
    );
  }

  return context.next();
});
