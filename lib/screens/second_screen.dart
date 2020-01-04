import 'package:flutter/cupertino.dart';

class SecondScreen extends StatelessWidget {
  final String payload;

  const SecondScreen({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Second page - Payload:',
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          const SizedBox(height: 8),
          Text(
            payload,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          const SizedBox(height: 8),
          CupertinoButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}