import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final String day;

  TodoList(this.day);

  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoList> {
  Widget _buildTask(String taskContent){
    return new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Checkbox(value: checkboxValue,onChanged:(bool value){
                  setState(() {
                    checkboxValue = value;
                  });
                },activeColor: Colors.grey,),
                new Text(taskContent,style: new TextStyle(color: Colors.grey,fontSize: 18.0,fontWeight: FontWeight.w500),)
              ],
            ),
            Divider(),
          ],
        )
    );
  }

  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: new Text(
              "Today",
              style: new TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
          _buildTask("Your Job"),
        ],
      ),
    );
  }
}
