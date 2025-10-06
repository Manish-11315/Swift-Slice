import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabState()) {
    on<ChangeTab>((event, emit) {
      emit(TabState(tabIndex: event.tabIndex));
    });
  }
}
