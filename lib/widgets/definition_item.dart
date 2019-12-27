import 'package:flutter/material.dart';
import 'package:wordsearch/models/definition.dart';

class DefintionItemWidget extends StatelessWidget {
  final Definition definition;

  DefintionItemWidget(this.definition);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
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
                  ),
                  Column(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      definition.definition,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          definition.example,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
