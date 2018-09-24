import 'package:flutter/material.dart';
import 'package:flutter_design/Pages/HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "AvenirLTStd"
      ),
      routes: {
        "/": (BuildContext context) => HomePage(),
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split("/");
        if(pathElements[1] == "detail"){
          final String todoId = pathElements[2];
        }
      },
    );
  }
}

