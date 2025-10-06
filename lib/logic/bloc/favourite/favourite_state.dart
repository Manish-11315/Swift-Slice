part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<FoodItem> favouriteItems;

  const FavouriteLoaded({this.favouriteItems = const []});

  @override
  List<Object> get props => [favouriteItems];
}

class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}