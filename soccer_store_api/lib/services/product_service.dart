import 'package:mongo_dart/mongo_dart.dart';
import 'package:soccer_store_api/database.dart';

class ProductService {
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final db = await MongoDatabase.connection;
    final collection = db.collection('products');
    return await collection.find().toList();
  }

  Future<Map<String, dynamic>?> getProductById(String id) async {
    final db = await MongoDatabase.connection;
    final collection = db.collection('products');
    return await collection.findOne(where.id(ObjectId.fromHexString(id)));
  }
}
