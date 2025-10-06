import 'package:basic_food_delivery_app/logic/bloc/notification/notification_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:basic_food_delivery_app/data/models/notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  List<Notification> _allNotifications = [];

  NotificationBloc() : super(NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<SearchNotifications>(_onSearchNotifications);
  }

  void _onLoadNotifications(
      LoadNotifications event, Emitter<NotificationState> emit) {
    emit(NotificationLoading());
    try {
      _allNotifications = [
        Notification(
          id: '1',
          type: NotificationType.discount,
          title: 'Get 20% Discount Code',
          message: 'Get discount codes from sharing with friends.',
          timestamp: DateTime(2025, 10, 6, 12, 20),
        ),
        Notification(
          id: '2',
          type: NotificationType.discount,
          title: 'Get 10% Discount Code',
          message: 'Holiday discount code.',
          timestamp: DateTime(2025, 10, 6, 11, 10),
        ),
        Notification(
          id: '3',
          type: NotificationType.orderReceived,
          title: 'Order Received',
          message: 'Order #SP_0023900 has been delivered successfully.',
          timestamp: DateTime(2025, 10, 6, 10, 15),
        ),
        Notification(
          id: '4',
          type: NotificationType.orderOnTheWay,
          title: 'Order on the Way',
          message: 'Your delivery driver is on the way with your order.',
          timestamp: DateTime(2025, 10, 6, 10, 10),
        ),
        Notification(
          id: '5',
          type: NotificationType.orderConfirmed,
          title: 'Your Order is Confirmed',
          message: 'Your order #SP_0023900 has been confirmed.',
          timestamp: DateTime(2025, 10, 5, 9, 59),
        ),
        Notification(
          id: '6',
          type: NotificationType.orderSuccessful,
          title: 'Order Successful',
          message: 'Order #SP_0023900 has been placed successfully.',
          timestamp: DateTime(2025, 10, 5, 9, 56),
        ),
        Notification(
          id: '7',
          type: NotificationType.orderCancelled,
          title: 'Order Cancelled',
          message: 'Order #SP_0023450 has been cancelled.',
          timestamp: DateTime(2025, 10, 5, 22, 40),
        ),
        Notification(
          id: '8',
          type: NotificationType.accountSetup,
          title: 'Account Setup Successful',
          message: 'Congratulations! Your account setup was successful.',
          timestamp: DateTime(2025, 10, 4, 20, 15),
        ),
        Notification(
          id: '9',
          type: NotificationType.creditCardConnected,
          title: 'Credit Card Connected',
          message: 'Congratulations! Your credit card has been successfully added.',
          timestamp: DateTime(2025, 10, 4, 20, 20),
        ),
        Notification(
          id: '10',
          type: NotificationType.discount,
          title: 'Get 5% Discount Code',
          message: 'Discount code for new users.',
          timestamp: DateTime(2025, 9, 30, 11, 10),
        ),
      ];
      emit(NotificationLoaded(_allNotifications, _allNotifications));
    } catch (_) {
      emit(NotificationError());
    }
  }

  void _onSearchNotifications(
      SearchNotifications event, Emitter<NotificationState> emit) {
    final currentState = state;
    if (currentState is NotificationLoaded) {
      emit(NotificationSearching() as NotificationState);
      final query = event.query.toLowerCase();
      if (query.isEmpty) {
        emit(NotificationLoaded(currentState.allNotifications, currentState.allNotifications));
      } else {
        final filteredList = currentState.allNotifications.where((notification) {
          final title = notification.title.toLowerCase();
          final message = notification.message.toLowerCase();
          final isToday = isTodayF(notification.timestamp) && 'today'.contains(query);
          final isYesterday = isYesterdayF(notification.timestamp) && 'yesterday'.contains(query);

          return title.contains(query) ||
              message.contains(query) ||
              isToday ||
              isYesterday;
        }).toList();
        emit(NotificationLoaded(currentState.allNotifications, filteredList));
      }
    }
  }

  bool isTodayF(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day && now.month == date.month && now.year == date.year;
  }

  bool isYesterdayF(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == date.day &&
        yesterday.month == date.month &&
        yesterday.year == date.year;
  }
}