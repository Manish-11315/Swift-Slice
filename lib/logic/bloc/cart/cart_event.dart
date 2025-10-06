part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final FoodItem foodItem;

  const AddToCart(this.foodItem);

  @override
  List<Object> get props => [foodItem];
}

class RemoveItemFromCart extends CartEvent {
  final CartItem cartItem;

  const RemoveItemFromCart(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class IncrementQuantity extends CartEvent {
  final CartItem cartItem;

  const IncrementQuantity(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class DecrementQuantity extends CartEvent {
  final CartItem cartItem;

  const DecrementQuantity(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}
