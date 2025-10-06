part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> banners;
  final List<Map<String, String>> categories;
  final List<FoodItem> popularNow;
  final List<Map<String, String>> filteredCategories;

  const HomeLoaded({
    required this.banners,
    required this.categories,
    required this.popularNow,
    required this.filteredCategories,
  });

  @override
  List<Object> get props => [banners, categories, popularNow, filteredCategories];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
