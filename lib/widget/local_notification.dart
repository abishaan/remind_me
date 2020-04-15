import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:remind_me/screens/praveen/SecondPage.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() => _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
//    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

//    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//    var initializationSettingsIOS = IOSInitializationSettings(
//        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//    var initializationSettings = InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: selectNotification);
//
//    final settingAndriod = AndroidInitializationSettings('app_icon');
//    Icons.notifications
//    final settingIOS = IOSInitializationSettings(
//        onDidReceiveLocalNotification: (id,title,body,payload) =>
//        onSelectNotification(payload));

  }
  //what should be executed on tap of notification
  Future selectNotification(String payload) async => await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>SecondPage(payload:payload)),
  );

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) {
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        title('Basics'),
        RaisedButton(
          child: Text('Show notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'Tite', body: 'Body'),
        ),
        RaisedButton(
          child: Text('Replace notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'ReplacedTitle', body: 'ReplacedBody'),
        ),
        RaisedButton(
          child: Text('Other notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'OtherTitle', body: 'OtherBody', id: 20),
        ),
        const SizedBox(height: 32),
        title('Feautures'),
        RaisedButton(
          child: Text('Silent notification'),
          onPressed: () => showSilentNotification(notifications,
              title: 'SilentTitle', body: 'SilentBody', id: 30),
        ),
        const SizedBox(height: 32),
        title('Cancel'),
        RaisedButton(
          child: Text('Cancel all notification'),
          onPressed: notifications.cancelAll,
        ),
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
}