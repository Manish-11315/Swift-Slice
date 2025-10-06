part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class SearchCategories extends HomeEvent {
  final String query;

  const SearchCategories(this.query);

  @override
  List<Object> get props => [query];
}
