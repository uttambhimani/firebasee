import 'package:firebase/view_screen/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void fireNotificationReg() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  var idToken = await firebaseMessaging.getToken();

  print("Token $idToken");

  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    var data = message.notification!.body;
    var title = message.notification!.title;

    notificationData("$title", "$data");

    print("=====================Time :$title \n Body: $data");
  });
}

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

void notificationData(String title, String body) async {
  AndroidNotificationDetails and = AndroidNotificationDetails("1", "android",
      priority: Priority.high, importance: Importance.max);

  NotificationDetails nd = NotificationDetails(android: and);

  await flnp!.show(1, "$title", "$body", nd);
}
