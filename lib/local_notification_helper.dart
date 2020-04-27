//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:meta/meta.dart';
//import 'package:flutter/material.dart';
//
//NotificationDetails get _ongoing{
//  final androidChannelSpecifics = AndroidNotificationDetails(
//    'your channel id',
//    'your channel name',
//    'your channel description',
//    importance: Importance.Max,
//    priority: Priority.High,
//    ongoing: true,
//    autoCancel: false
//  );
//  final ioSChannelSpecifics = IOSNotificationDetails();
//  return NotificationDetails(androidChannelSpecifics, ioSChannelSpecifics);
//}
//
//Future showOngoingNotification(
//    FlutterLocalNotificationsPlugin notifications, {
//      @required String title,
//      @required String body,
//      int id = 0,
//    }) =>
//    _showNotification(notifications,
//        title: title, body: body, id: id, type: _ongoing);
//
//Future _showNotification(
//    FlutterLocalNotificationsPlugin notifications, {
//      @required String title,
//      @required String body,
//      @required NotificationDetails type,
//      int id = 0,
//    }) =>
//    notifications.show(id, title, body, type);
//
//Future showAtDayAndTime(FlutterLocalNotificationsPlugin notifications,int id,Day day,Time time,String title,String description) async{
//  final andriodPlatformChannel = AndroidNotificationDetails(
//    'show weekly channel id',
//    'show weekly channel name',
//    'show weekly description',
//  );
//  final iOSPlatformChannel = IOSNotificationDetails();
//  final platformChannelSpecifics = NotificationDetails(andriodPlatformChannel,
//    iOSPlatformChannel,
//  );
//
//  await notifications.showWeeklyAtDayAndTime(
//    id,
//    title,
//    description,
//    day,
//    time,
//    platformChannelSpecifics,
//  );
//}
//
//Future<List<PendingNotificationRequest>> getScheduledNotifications(FlutterLocalNotificationsPlugin notifications) async {
//  final pendingNotifications = await notifications.pendingNotificationRequests();
//  return pendingNotifications;
//}
//
//Future<void> cancelNotification(int id,FlutterLocalNotificationsPlugin notifications) async {
//  await notifications.cancel(id);
//}
//
//
//
////part 3
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
