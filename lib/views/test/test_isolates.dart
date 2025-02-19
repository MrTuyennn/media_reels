import 'dart:convert';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Model to represent a notification
class NotificationModel {
  final String image;
  final String title;
  final String body;
  final DateTime timestamp;

  NotificationModel({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  // Factory constructor to create an instance from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json['image'] ?? '', // Providing default empty string if no image
      title: json['title'] ?? '', // Default empty string if no title
      body: json['body'] ?? '', // Default empty string if no body
      timestamp: DateTime.parse(
          json['timestamp']), // Parsing the timestamp field to DateTime
    );
  }
}

// URL to fetch notifications from
const String notificationApi =
    'https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json';

// Dio instance for making HTTP requests
Dio dio = Dio();

// Function to fetch notifications using Dio
Future<List<NotificationModel>> fetchNotifications() async {
  try {
    final response = await dio.get(notificationApi);

    // Check for successful response (200 OK)
    if (response.statusCode == 200) {
      developer.log('Fetched notifications successfully',
          name: 'fetchNotifications', level: 0);
      // Use compute to parse notifications in the background
      //  return await compute(parseNotifications, response.data);

      return parseNotifications(response.data);
    } else {
      throw Exception('Failed to load notifications: ${response.statusCode}');
    }
  } catch (e) {
    developer.log('Error fetching notifications: $e',
        name: 'fetchNotifications', level: 1);
    throw Exception('Error fetching notifications: $e');
  }
}

// Function to parse the response and convert it into NotificationModel in an isolate
Future<List<NotificationModel>> parseNotifications(dynamic responseBody) async {
  try {
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);
    final List<dynamic> data = jsonResponse['data'];
    return data
        .map((notification) => NotificationModel.fromJson(notification))
        .toList();
  } catch (e) {
    developer.log('Error parsing notifications: $e',
        name: 'parseNotifications', level: 1);
    throw Exception('Error parsing notifications: $e');
  }
}

class TestIsolates extends StatefulWidget {
  const TestIsolates({super.key});

  @override
  State<TestIsolates> createState() => _TestIsolatesState();
}

class _TestIsolatesState extends State<TestIsolates> {
  List<NotificationModel> _notifications = [];
  String _responseMessage = "Fetching data...";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // Function to fetch data from API
  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final notifications = await fetchNotifications();
      setState(() {
        _notifications = notifications;
        _responseMessage = 'Notifications fetched successfully!';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _responseMessage = 'Error fetching notifications: $e';
        _isLoading = false;
      });
    }
  }

  // Function to format the DateTime into a readable string
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _fetchData();
              },
              child: const Text('data')),
          Expanded(
            child: _isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator while fetching
                : _notifications.isEmpty
                    ? const Center(child: Text('No notifications available.'))
                    : ListView.builder(
                        itemCount: _notifications.length,
                        itemBuilder: (context, index) {
                          final notification = _notifications[index];

                          // Directly accessing notification data
                          final imageUrl = notification.image;
                          final title = notification.title;
                          final body = notification.body;
                          final timestamp =
                              formatDateTime(notification.timestamp);

                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              // leading: imageUrl.isNotEmpty
                              //     ? Image.network(imageUrl)
                              // : Icon(Icons.image_not_supported), // Fallback icon if no image
                              title: Text(title),
                              subtitle: Text(body),
                              trailing: Text(
                                  timestamp), // Displaying formatted timestamp
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
