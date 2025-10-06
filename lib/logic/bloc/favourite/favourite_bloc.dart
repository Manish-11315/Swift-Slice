import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/food_item.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteLoading()) {
    on<LoadFavourites>(_onLoadFavourites);
    on<AddFavourite>(_onAddFavourite);
    on<RemoveFavourite>(_onRemoveFavourite);
  }

  void _onLoadFavourites(LoadFavourites event, Emitter<FavouriteState> emit) {
    emit(const FavouriteLoaded());
  }

  void _onAddFavourite(AddFavourite event, Emitter<FavouriteState> emit) {
    final state = this.state;
    if (state is FavouriteLoaded) {
      print('Adding ${event.foodItem.name} to favourites');
      final newList = List<FoodItem>.from(state.favouriteItems)..add(event.foodItem);
      emit(FavouriteLoaded(favouriteItems: newList));
      print('New favourite list: ${newList.map((e) => e.name).toList()}');
    }
  }

  void _onRemoveFavourite(RemoveFavourite event, Emitter<FavouriteState> emit) {
    final state = this.state;
    if (state is FavouriteLoaded) {
      print('Removing ${event.foodItem.name} from favourites');
      final newList = List<FoodItem>.from(state.favouriteItems)..remove(event.foodItem);
      emit(FavouriteLoaded(favouriteItems: newList));
      print('New favourite list: ${newList.map((e) => e.name).toList()}');
    }
  }
}