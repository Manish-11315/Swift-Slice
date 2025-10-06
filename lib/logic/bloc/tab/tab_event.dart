part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class ChangeTab extends TabEvent {
  final int tabIndex;

  const ChangeTab(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
