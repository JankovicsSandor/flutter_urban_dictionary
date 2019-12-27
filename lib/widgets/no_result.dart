import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.sentiment_dissatisfied,
            size: 86,
            color: Theme.of(context).accentColor,
          ),
          Text(
            "No result",
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 36),
          )
        ],
      ),
    );
  }
}
