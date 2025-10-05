import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/food_item.dart';

class CartItem extends Equatable {
  final FoodItem foodItem;
  final int quantity;

  const CartItem({
    required this.foodItem,
    this.quantity = 1,
  });

  CartItem copyWith({
    FoodItem? foodItem,
    int? quantity,
  }) {
    return CartItem(
      foodItem: foodItem ?? this.foodItem,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [foodItem, quantity];
}
