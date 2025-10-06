import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>((event, emit) {
      try {
        // Replace with actual user data fetching logic
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john.doe@example.com',
          address: '123 Main St, Anytown, USA',
        );
        emit(const ProfileLoaded(user));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
