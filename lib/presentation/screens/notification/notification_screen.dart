
import 'package:basic_food_delivery_app/logic/bloc/notification/notification_bloc.dart';
import 'package:basic_food_delivery_app/presentation/screens/notification/widgets/notification_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:basic_food_delivery_app/data/models/notification.dart' as data;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      context
          .read<NotificationBloc>()
          .add(SearchNotifications(_searchController.text));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Notification'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoading || state is NotificationSearching) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is NotificationLoaded) {
                    return _buildNotificationList(state.filteredNotifications);
                  }
                  if (state is NotificationError) {
                    return const Center(child: Text('Failed to load notifications'));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<data.Notification> notifications) {
    final Map<String, List<data.Notification>> groupedNotifications = {};
    for (var notification in notifications) {
      final String groupKey;
      if (isToday(notification.timestamp)) {
        groupKey = 'Today';
      } else if (isYesterday(notification.timestamp)) {
        groupKey = 'Yesterday';
      } else {
        groupKey = DateFormat('dd/MM/yyyy').format(notification.timestamp);
      }

      if (groupedNotifications[groupKey] == null) {
        groupedNotifications[groupKey] = [];
      }
      groupedNotifications[groupKey]!.add(notification);
    }

    return ListView(
      children: groupedNotifications.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                entry.key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            ...entry.value.map((notification) => NotificationListItem(notification: notification)),
          ],
        );
      }).toList(),
    );
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day && now.month == date.month && now.year == date.year;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == date.day && yesterday.month == date.month && yesterday.year == date.year;
  }
}
