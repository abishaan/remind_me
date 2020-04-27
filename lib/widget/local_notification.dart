// This file contains the notification related function
//resources used to refer:
//1. https://github.com/RobertBrunhage/water_reminder_app_youtube/tree/develop
//2. https://github.com/JohannesMilke/local_push_notifications

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../local_notification_helper.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _NotificationPlugin extends StatefulWidget {
  @override
  __NotificationPluginState createState() => __NotificationPluginState();
}

class __NotificationPluginState extends State<_NotificationPlugin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  String notiTitle, notiBody;
  DateTime scheduleDate;
  static final flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) {}

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {}

  Future<void> notificationCheck(DateTime dateTime, String title, String body) async {
//    var scheduledNotificationDateTime =
//    DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0, title, body, dateTime, platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            title('Basics'),
            RaisedButton(
                child: Text('Show notification'),
                onPressed: () async {
                  notificationCheck(scheduleDate, 'Catergory', "Homework");
                }),
            const SizedBox(height: 32),
            title('Cancel'),
            RaisedButton(
              child: Text('Cancel all notification'),
              onPressed: flutterLocalNotificationsPlugin.cancelAll,
            ),
            FlatButton(
              color: Colors.red,
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                        setState(() {
                          scheduleDate = date;
                        });
                  }, onConfirm: (date) {
                    setState(() {
                      scheduleDate = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'show date time picker',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );

  Widget title(String text) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
      );

//Future<void> _scheduleNotification() async {
//  var scheduledNotificationDateTime =
//  DateTime.now().add(Duration(seconds: 5));
//  var vibrationPattern = Int64List(4);
//  vibrationPattern[0] = 0;
//  vibrationPattern[1] = 1000;
//  vibrationPattern[2] = 5000;
//  vibrationPattern[3] = 2000;
//
//  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//      'your other channel id',
//      'your other channel name',
//      'your other channel description',
//      icon: 'app_icon',
//      //sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
//      vibrationPattern: vibrationPattern,
//      enableLights: true,
//      color: const Color.fromARGB(255, 255, 0, 0),
//      ledColor: const Color.fromARGB(255, 255, 0, 0),
//      ledOnMs: 1000,
//      ledOffMs: 500);
//  var iOSPlatformChannelSpecifics =
//  IOSNotificationDetails(sound: 'slow_spring_board.aiff');
//  var platformChannelSpecifics = NotificationDetails(
//      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//  await flutterLocalNotificationsPlugin.schedule(
//      0,
//      'scheduled title',
//      'scheduled body',
//      scheduledNotificationDateTime,
//      platformChannelSpecifics);
//}
}
