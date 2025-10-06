part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavourites extends FavouriteEvent {}

class AddFavourite extends FavouriteEvent {
  final FoodItem foodItem;

  const AddFavourite(this.foodItem);

  @override
  List<Object> get props => [foodItem];
}

class RemoveFavourite extends FavouriteEvent {
  final FoodItem foodItem;

  const RemoveFavourite(this.foodItem);

  @override
  List<Object> get props => [foodItem];
}