part of 'tab_bloc.dart';

class TabState extends Equatable {
  final int tabIndex;

  const TabState({this.tabIndex = 0});

  @override
  List<Object> get props => [tabIndex];
}
