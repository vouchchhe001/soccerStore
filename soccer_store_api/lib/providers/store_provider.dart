import 'package:soccer_store_api/models/store_models.dart';

class StoreProvider {
  final List<Brand> brands = [
    Brand(id: '1', name: 'Nike', origin: 'USA'),
    Brand(id: '2', name: 'Adidas', origin: 'Germany'),
    Brand(id: '3', name: 'Puma', origin: 'Germany'),
  ];

  final List<Category> categories = [
    Category(id: '1', name: 'Footwear'),
    Category(id: '2', name: 'Equipment'),
    Category(id: '3', name: 'Apparel'),
  ];

  final List<Supplier> suppliers = [
    Supplier(id: '1', name: 'Global Sports Dist', contact: 'contact@globalsports.com'),
    Supplier(id: '2', name: 'Elite Gear Co', contact: 'sales@elitegear.com'),
  ];

  final List<Order> orders = [
    Order(id: '1', customerId: 'cust1', date: DateTime.now(), totalAmount: 119.98),
  ];

  final List<OrderDetail> orderDetails = [
    OrderDetail(id: '1', orderId: '1', productId: '1', quantity: 1, unitPrice: 29.99),
    OrderDetail(id: '2', orderId: '1', productId: '2', quantity: 1, unitPrice: 89.99),
  ];

  T getById<T>(List<T> list, String id, String Function(T) idSelector) {
    try {
      return list.firstWhere((item) => idSelector(item) == id);
    } catch (_) {
      throw Exception('Not found');
    }
  }
}
