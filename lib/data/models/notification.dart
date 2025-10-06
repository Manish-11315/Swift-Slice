import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  discount,
  orderReceived,
  orderOnTheWay,
  orderConfirmed,
  orderSuccessful,
  orderCancelled,
  accountSetup,
  creditCardConnected,
}

class Notification extends Equatable {
  final String id;
  final NotificationType type;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  const Notification({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.discount:
        return Icons.local_offer;
      case NotificationType.orderReceived:
        return Icons.check_circle;
      case NotificationType.orderOnTheWay:
        return Icons.delivery_dining;
      case NotificationType.orderConfirmed:
        return Icons.store;
      case NotificationType.orderSuccessful:
        return Icons.shopping_bag;
      case NotificationType.orderCancelled:
        return Icons.cancel;
      case NotificationType.accountSetup:
        return Icons.person;
      case NotificationType.creditCardConnected:
        return Icons.credit_card;
      default:
        return Icons.notifications;
    }
  }

  Color get iconColor {
    switch (type) {
      case NotificationType.discount:
        return Colors.orange;
      case NotificationType.orderReceived:
      case NotificationType.orderOnTheWay:
      case NotificationType.orderConfirmed:
      case NotificationType.orderSuccessful:
      case NotificationType.accountSetup:
      case NotificationType.creditCardConnected:
        return Colors.green;
      case NotificationType.orderCancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  List<Object?> get props => [id, type, title, message, timestamp, isRead];
}