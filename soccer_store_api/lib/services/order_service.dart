import 'package:mongo_dart/mongo_dart.dart';
import 'package:soccer_store_api/database.dart';

class OrderService {
  Future<List<Map<String, dynamic>>> getAllOrders() async {
    final db = await MongoDatabase.connection;
    final collection = db.collection('orders');
    return await collection.find().toList();
  }

  Future<Map<String, dynamic>?> getOrderById(String id) async {
    final db = await MongoDatabase.connection;
    final collection = db.collection('orders');
    return await collection.findOne(where.id(ObjectId.fromHexString(id)));
  }
}
