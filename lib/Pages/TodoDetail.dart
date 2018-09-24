import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoDetailState();
  }
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        body: new Container(
          child: new Text("sssss"),
        ),
      ),
    );
  }

}