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

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: new Text(
              "Today",
              style: new TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),

          TodoCard("Your Job"),
          TodoCard("Your Job"),
          TodoCard("Your Job"),
          TodoCard("Your Job"),
          TodoCard("Your Job"),
          TodoCard("Your Job"),
          TodoCard("Your Job"),
        ],
      ),
    );
  }
}



class TodoCard extends StatefulWidget {
  String task;
  TodoCard(this.task);

  @override
  State<StatefulWidget> createState() {
    return _TodoCardState();
  }
}

class _TodoCardState extends State<TodoCard>{
  bool checkboxValue = false;
  Widget _buildTask(String taskContent) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Checkbox(
            value: checkboxValue,
            onChanged: (bool value) {
              setState(() {
                checkboxValue = value;
              });
            },
            activeColor: Colors.grey,
          ),
          new Text(
            taskContent,
            style: new TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildTask(widget.task);
  }
}
