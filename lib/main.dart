import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordsearch/screens/search_result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Search',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          buttonColor: Colors.deepPurple),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black45,
          accentColor: Colors.blueGrey[800],
          buttonColor: Colors.grey),
      home: MyHomePage(title: 'Urban dictionary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText;

  bool keyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            keyboardOpen = false;
          });
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: keyboardOpen
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Search your word",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your word',
                          ),
                          onTap: () {
                            setState(() {
                              keyboardOpen = true;
                            });
                          },
                          onFieldSubmitted: (val) {
                            setState(() {
                              keyboardOpen = false;
                              if (searchText != null && searchText != '') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SearchResultScreen(
                                      searchText,
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: (value) {
                            searchText = value;
                          },
                        ),
                      ),
                      RaisedButton(
                        elevation: 2.0,
                        //color: Theme.of(context).accentColor,
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (searchText != null && searchText != '') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SearchResultScreen(
                                  searchText,
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
