part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSearching extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notification> allNotifications;
  final List<Notification> filteredNotifications;

  const NotificationLoaded(this.allNotifications, this.filteredNotifications);

  @override
  List<Object> get props => [allNotifications, filteredNotifications];
}

class NotificationError extends NotificationState {}
