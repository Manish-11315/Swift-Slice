import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/cart_item.dart';
import 'package:basic_food_delivery_app/data/models/food_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>((event, emit) {
      emit(const CartLoaded());
    });

    on<AddToCart>((event, emit) {
      if (state is CartLoaded) {
        final List<CartItem> updatedCartItems = List.from((state as CartLoaded).cartItems);
        bool itemExists = false;
        for (int i = 0; i < updatedCartItems.length; i++) {
          if (updatedCartItems[i].foodItem.id == event.foodItem.id) {
            updatedCartItems[i] = updatedCartItems[i].copyWith(quantity: updatedCartItems[i].quantity + 1);
            itemExists = true;
            break;
          }
        }
        if (!itemExists) {
          updatedCartItems.add(CartItem(foodItem: event.foodItem));
        }
        emit(CartLoaded(cartItems: updatedCartItems));
      }
    });

    on<RemoveItemFromCart>(_onRemoveItemFromCart);
    on<IncrementQuantity>(_onIncrementQuantity);
    on<DecrementQuantity>(_onDecrementQuantity);
  }

  void _onRemoveItemFromCart(RemoveItemFromCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedCartItems = List.from(state.cartItems)..remove(event.cartItem);
      emit(CartLoaded(cartItems: updatedCartItems));
    }
  }

  void _onIncrementQuantity(IncrementQuantity event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedCartItems = state.cartItems.map((cartItem) {
        return cartItem.foodItem.id == event.cartItem.foodItem.id
            ? cartItem.copyWith(quantity: cartItem.quantity + 1)
            : cartItem;
      }).toList();
      emit(CartLoaded(cartItems: updatedCartItems));
    }
  }

  void _onDecrementQuantity(DecrementQuantity event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedCartItems = state.cartItems.map((cartItem) {
        return cartItem.foodItem.id == event.cartItem.foodItem.id
            ? cartItem.copyWith(quantity: cartItem.quantity - 1)
            : cartItem;
      }).where((cartItem) => cartItem.quantity > 0).toList();
      emit(CartLoaded(cartItems: updatedCartItems));
    }
  }
}
