import 'package:flutter/cupertino.dart';
import 'package:local_notifications/widgets/notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Local Notifications';
  @override
  Widget build(BuildContext context) => CupertinoApp(
        title: appTitle,
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(appTitle),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationWidget(),
        ),
      );
}