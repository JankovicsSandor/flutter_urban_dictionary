import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wordsearch/models/definition.dart';
import 'package:http/http.dart' as http;
import 'package:wordsearch/widgets/definition_item.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchWord;

  SearchResultScreen(this.searchWord);

  @override
  State<StatefulWidget> createState() {
    return SearchResultScreenState(this.searchWord);
  }
}

class SearchResultScreenState extends State<SearchResultScreen> {
  SearchResultScreenState(searchWord) {
    definitions = getDefinition(searchWord);
  }

  final String apiPath =
      "https://mashape-community-urban-dictionary.p.rapidapi.com/define";

  final String apiKey = "30b9f58c29mshca196fbe12fe639p1a1826jsn57b9fe1f2e75";

  Future<List<Definition>> definitions;

  Future<List<Definition>> getDefinition(String searchWord) async {
    final response = await http.get(
      apiPath + "?term=" + searchWord,
      headers: {
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": "mashape-community-urban-dictionary.p.rapidapi.com"
      },
    );

    if (response.statusCode == 200) {
      var resultObjec = jsonDecode(response.body);

      var list = resultObjec["list"] as List;
      List<Definition> definitionList =
          list.map((i) => Definition.fromJson(i)).toList();

      definitionList.sort((a, b) => b.thumbs_up.compareTo(a.thumbs_up));
      return definitionList;
    }

    return [];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchWord),
      ),
      body: FutureBuilder<List<Definition>>(
        future: definitions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return DefintionItemWidget(snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
