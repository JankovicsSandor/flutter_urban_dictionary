import 'package:flutter/material.dart';
import 'package:wordsearch/models/definition.dart';

class DefintionItemWidget extends StatelessWidget {
  Definition definition;

  DefintionItemWidget(@required this.definition);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(2),
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.14,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up,
                      size: 20,
                    ),
                    Text(
                      "${definition.thumbs_up}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                children: <Widget>[
                  Text(definition.definition),
                  Text(definition.example),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.15,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.thumb_down,
                      size: 20,
                    ),
                    Text(
                      "${definition.thumbs_down}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
