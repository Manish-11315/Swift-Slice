import 'package:basic_food_delivery_app/data/models/notification.dart' as data;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationListItem extends StatelessWidget {
  final data.Notification notification;

  const NotificationListItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: notification.iconColor.withOpacity(0.1),
            child: Icon(
              notification.icon,
              color: notification.iconColor,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(notification.message),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('HH:mm').format(notification.timestamp),
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(notification.timestamp),
                style: const TextStyle(color: Colors.grey),
              ),
              if (!notification.isRead)
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
