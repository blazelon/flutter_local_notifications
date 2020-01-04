import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notifications/notifications_helper.dart';
import 'package:local_notifications/screens/second_screen.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final FlutterLocalNotificationsPlugin notifications = new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var settingsAndroid = new AndroidInitializationSettings('app_icon');

    var settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
          onSelectNotification(payload));

    notifications.initialize(InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }
        
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        title('Basics'),
        CupertinoButton(
          child: Text('Show notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'Tite', body: 'Body'),
        ),
        CupertinoButton(
          child: Text('Replace notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'ReplacedTitle', body: 'ReplacedBody'),
        ),
        CupertinoButton(
          child: Text('Other notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'OtherTitle', body: 'OtherBody', id: 20),
        ),
        const SizedBox(height: 32),
        title('Feautures'),
        CupertinoButton(
          child: Text('Silent notification'),
          onPressed: () => showSilentNotification(notifications,
              title: 'SilentTitle', body: 'SilentBody', id: 30),
        ),
        const SizedBox(height: 32),
        title('Cancel'),
        CupertinoButton(
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
        style: CupertinoTheme.of(context).textTheme.textStyle,
        textAlign: TextAlign.center,
      ),
    );

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new CupertinoPageRoute(builder: (context) => new SecondScreen(payload: payload)),
    );    
  }
}