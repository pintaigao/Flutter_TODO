import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: EdgeInsets.only(top: 100.0),
        child: new Flex(
          direction: Axis.vertical,
          children: <Widget>[
            new Hero(
                tag: "add-action",
                child: new Material(
                  child: new InkWell(
                      onTap: () => print("press"),
                      child: new Container(
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        child: new Icon(
                          Icons.add,
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
