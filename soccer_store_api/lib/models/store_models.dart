class Brand {
  final String id;
  final String name;
  final String origin;

  Brand({required this.id, required this.name, required this.origin});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'origin': origin};
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Supplier {
  final String id;
  final String name;
  final String contact;

  Supplier({required this.id, required this.name, required this.contact});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'contact': contact};
}

class Order {
  final String id;
  final String customerId;
  final DateTime date;
  final double totalAmount;

  Order({required this.id, required this.customerId, required this.date, required this.totalAmount});

  Map<String, dynamic> toJson() => {'id': id, 'customerId': customerId, 'date': date.toIso8601String(), 'totalAmount': totalAmount};
}

class OrderDetail {
  final String id;
  final String orderId;
  final String productId;
  final int quantity;
  final double unitPrice;

  OrderDetail({required this.id, required this.orderId, required this.productId, required this.quantity, required this.unitPrice});

  Map<String, dynamic> toJson() => {'id': id, 'orderId': orderId, 'productId': productId, 'quantity': quantity, 'unitPrice': unitPrice};
}
