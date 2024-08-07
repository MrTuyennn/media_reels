// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:live_mall/fmc/notification_service.dart';
// import 'package:live_mall/main.dart';
// import 'package:live_mall/models/notification/model_notified_data.dart';
// import 'package:live_mall/models/version_app_mobile/model_version_app_mobile.dart';
// import 'package:live_mall/networks/dio_client.dart';
// import 'package:live_mall/networks/end_points.dart';
// import 'package:live_mall/repository/index.dart';
// import 'package:live_mall/store/key_secure_storage.dart';
// import 'package:live_mall/store/secure_storage.dart';
// import 'package:live_mall/utils/channels/channel_app.dart';
// import 'package:live_mall/utils/logic/logger.dart';

// final versionRepository = VersionAppRepository();

// class RemoteNotificationService {
//   RemoteNotificationService() {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     initNotificationSettings(messaging);
//   }

//   Future<void> initNotificationSettings(FirebaseMessaging messaging) async {
//     await messaging.getInitialMessage();
//     await messaging.setAutoInitEnabled(true);

//     try {
//       await messaging.getToken().then((token) async {
//         logger.e("Token Notification: $token");

//         await SecureStorage()
//             .setSecureData(KeySecureStorage.DEV_TOKEN, token.toString());
//         //subscribes to topics
//         await messaging.subscribeToTopic(Endpoints.fcmSystem).then((value) =>
//             DioClient.instance.get(
//                 "${Endpoints.baseURL}/ciplive/v1/common/log?data=topic:${Endpoints.fcmSystem}"));
//         await SecureStorage().setSecureData(
//             KeySecureStorage.NOTIFICATION, NotificationKey.subNotif);
//         Map<dynamic, dynamic> appInfo =
//             await methodChannel.invokeMethod(methodVersion);
//         final resultApp = VersionAppMobileModel.fromJson(appInfo);
//         await versionRepository.fetchPushInfoMobile(
//             resultApp.uuid.toString(), token.toString());
//       });

//       FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         notificationService.showForegroundNotifications(message);
//       });

//       FirebaseMessaging.onMessageOpenedApp.listen((message) {
//         final dataNotified = DataNotification.fromJson(message.data['data']);
//         setNotificationHandler(dataNotified);
//       });
//     } catch (e) {
//       DioClient.instance.get(
//           "${Endpoints.baseURL}/ciplive/v1/common/log?data=erroInitFCM:$e");
//     }
//   }
// }
