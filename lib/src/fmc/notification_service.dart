// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:live_mall/fmc/remote_notifications_service.dart';
// import 'package:live_mall/main.dart';
// import 'package:live_mall/models/notification/model_notified_data.dart';
// import 'package:live_mall/store/key_secure_storage.dart';
// import 'package:live_mall/store/secure_storage.dart';
// import 'package:live_mall/utils/logic/functions.dart';
// import 'package:live_mall/utils/logic/logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// NotificationService notificationService = NotificationService();

// class NotificationService {
//   static final NotificationService _notificationService =
//       NotificationService._internal();

//   factory NotificationService() {
//     return _notificationService;
//   }

//   NotificationService._internal();

//   static const channelId = 'liveMall';
//   static const channelName = 'liveMall';

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     RemoteNotificationService();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//       macOS: null,
//     );

//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       channelId, // id
//       channelName, // title
//       importance: Importance.high,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse:
//           onDidReceiveBackgroundNotificationResponse,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//     );
//   }

//   Future<void> requestPermissionNotfication() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings statusNotification = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (statusNotification.authorizationStatus ==
//         AuthorizationStatus.authorized) {
//       await messaging.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//       await SecureStorage().setSecureData(
//           KeySecureStorage.NOTIFICATION, NotificationKey.subNotif);
//     } else {
//       await SecureStorage().setSecureData(
//           KeySecureStorage.NOTIFICATION, NotificationKey.unSubNotif);
//     }
//   }

//   Future<void> showForegroundNotifications(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     String language = "";

//     logger.t("++++token");

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     language = prefs.getString('_KEY_LANGUAGE') ?? 'en';
//     String parseLanguage = FunctionUtils().parceLocale(language);
//     logger.e(message.toMap());
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       jsonDecode(message.data["title"])[parseLanguage] ?? "Notification",
//       jsonDecode(message.data["body"])[parseLanguage],
//       const NotificationDetails(
//           android: AndroidNotificationDetails(
//             channelId,
//             channelName,
//             importance: Importance.max,
//             priority: Priority.high,
//           ),
//           iOS: DarwinNotificationDetails(
//             interruptionLevel: InterruptionLevel.timeSensitive,
//             presentSound: true,
//             presentList: true,
//             presentAlert: true,
//             presentBadge: true,
//             presentBanner: true,
//           )),
//       payload: jsonEncode(message.toMap()),
//     );
//   }

//   Future<void> cancelNotifications(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }

//   Future<void> cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
// }

// void onDidReceiveNotificationResponse(NotificationResponse details) async {
//   logger.e(details);
//   if (details.payload != null) {
//     try {
//       Map<String, dynamic> notificationPayload = jsonDecode(details.payload!);
//       final dataNotified =
//           DataNotification.fromJson(notificationPayload['data']);
//       setNotificationHandler(dataNotified);
//     } catch (error) {
//       logger.e(
//           'onDidReceiveNotificationResponse Notification payload error $error');
//     }
//   }
// }
