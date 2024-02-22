import 'dart:convert';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

@pragma("vm:entry-point")
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
  final notificationJson = json.decode(message.data["notificationJson"] ?? "");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    final FCMToken = await _firebaseMessaging.getToken();
    print('token: $FCMToken');
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  //
  Future<void> initAwesomeNotification() async {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        'resource://drawable/logo',
        [
          NotificationChannel(
            channelGroupKey: 'basic_tests',
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            defaultColor: AppColors.primaryColor,
            importance: NotificationImportance.Max,
            channelDescription: 'Notification channel for basic tests',
            channelShowBadge: false,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);

    /*   AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
    );*/

    @pragma("vm:entry-point")
    Future<void> onNotificationCreatedMethod(
        ReceivedNotification receivedNotification) async {
      String? createdSourceText = AwesomeAssertUtils.toSimpleEnumString(
          receivedNotification.createdSource);
      print("createdStream $receivedNotification");
    }

    @pragma("vm:entry-point")
    Future<void> onNotificationDisplayedMethod(
        ReceivedNotification receivedNotification) async {}

    @pragma("vm:entry-point")
    Future<void> onDismissActionReceivedMethod(
        ReceivedAction receivedAction) async {
      String? dismissedSourceText = await AwesomeAssertUtils.toSimpleEnumString(
          receivedAction.dismissedLifeCycle);
      print("dismissedStream $receivedAction");
    }

    @pragma("vm:entry-point")
    Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {}
  }
}
