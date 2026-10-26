import 'package:soccer_store_api/models/product.dart';

class ProductProvider {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Professional Soccer Ball',
      category: 'Equipment',
      price: 29.99,
      description: 'FIFA Quality Pro certified soccer ball for professional play.',
      imageUrl: 'https://example.com/ball.jpg',
    ),
    Product(
      id: '2',
      name: 'Training Cleats',
      category: 'Footwear',
      price: 89.99,
      description: 'High-performance cleats designed for durability and grip.',
      imageUrl: 'https://example.com/cleats.jpg',
    ),
    Product(
      id: '3',
      name: 'Goalie Gloves',
      category: 'Equipment',
      price: 45.00,
      description: 'Latex grip gloves for maximum ball control.',
      imageUrl: 'https://example.com/gloves.jpg',
    ),
    Product(
      id: '4',
      name: 'Team Jersey',
      category: 'Apparel',
      price: 60.00,
      description: 'Breathable, moisture-wicking fabric for team wear.',
      imageUrl: 'https://example.com/jersey.jpg',
    ),
  ];

  List<Product> getAllProducts() {
    return _products;
  }

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
