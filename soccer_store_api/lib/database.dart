import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? _db;

  static Future<Db> get connection async {
    if (_db != null) return _db!;

    // Replace with your actual MongoDB connection string
    _db = await Db.create('mongodb://localhost:27017/SoccerStore');
    await _db!.open();
    return _db!;
  }
}
