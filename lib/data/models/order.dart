import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/cart_item.dart';

enum OrderStatus {
  pending,
  preparing,
  onTheWay,
  delivered,
  cancelled,
}

class Order extends Equatable {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final OrderStatus status;
  final DateTime orderDate;

  const Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
  });

  @override
  List<Object?> get props => [id, items, totalAmount, status, orderDate];
}
