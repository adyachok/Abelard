import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  late final AndroidNotificationChannel channel;
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  init() async {
    channel = const AndroidNotificationChannel(
      'pegasus_firebase_notification', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.max,
    );
    await createChannel();
  }

  createChannel() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    print(message.notification?.title ?? 'Ok');
  }

  void setForegroundMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon ?? '@mipmap/ic_launcher',
                // other properties...
              ),
            ));
      }
    });
  }
}
