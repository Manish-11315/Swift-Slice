import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/food_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Map<String, String>> _allCategories = [];

  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<SearchCategories>(_onSearchCategories);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) {
    emit(HomeLoading());
    try {
      final List<String> banners = [
        'banner/banner1.png',
        'banner/banner2.png',
        'banner/banner3.png',
      ];

      _allCategories = [
        {'image': 'CategoryItems/burger_category_logo.png', 'name': 'Burger'},
        {'image': 'CategoryItems/burito_category_logo.png', 'name': 'Burrito'},
        {'image': 'CategoryItems/donut_category_logo.png', 'name': 'Donut'},
        {'image': 'CategoryItems/drinks_category_logo.png', 'name': 'Drinks'},
        {'image': 'CategoryItems/dumpling_category_logo.png', 'name': 'Dumpling'},
        {'image': 'CategoryItems/fruits_category_logo.png', 'name': 'Fruits'},
        {'image': 'CategoryItems/ice_cream_category_logo.png', 'name': 'Ice Cream'},
        {'image': 'CategoryItems/noodles_category_logo.png', 'name': 'Noodles'},
        {'image': 'CategoryItems/pasta_category_logo.png', 'name': 'Pasta'},
        {'image': 'CategoryItems/pizza_category_logo.png', 'name': 'Pizza'},
        {'image': 'CategoryItems/rice_category_logo.png', 'name': 'Rice'},
        {'image': 'CategoryItems/more_category_logo.png', 'name': 'More'},
      ];

      final List<FoodItem> popularNow = FoodItem.dummyItems;

      emit(HomeLoaded(
        banners: banners,
        categories: _allCategories,
        popularNow: popularNow,
        filteredCategories: _allCategories,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onSearchCategories(SearchCategories event, Emitter<HomeState> emit) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final query = event.query.toLowerCase();
      if (query.isEmpty) {
        emit(HomeLoaded(
          banners: currentState.banners,
          categories: currentState.categories,
          popularNow: currentState.popularNow,
          filteredCategories: currentState.categories,
        ));
      } else {
        final filteredList = _allCategories.where((category) {
          final name = category['name']!.toLowerCase();
          return name.contains(query);
        }).toList();
        emit(HomeLoaded(
          banners: currentState.banners,
          categories: currentState.categories,
          popularNow: currentState.popularNow,
          filteredCategories: filteredList,
        ));
      }
    }
  }
}
