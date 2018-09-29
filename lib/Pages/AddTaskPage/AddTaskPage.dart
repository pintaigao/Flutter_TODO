import 'dart:async';

import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskPage> {
  final _descriptionFocusNode = FocusNode();

  DateTime dateTime;
  String year;
  String month;
  String day;

  final Map<String, dynamic> _formData = {
    'task': null,
    'type': null,
    'date': null
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildForm(BuildContext context) {
    return new SingleChildScrollView(
      child: new Padding(
        padding: EdgeInsets.all(50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  focusNode: _descriptionFocusNode,
                  maxLines: 4,
                  style: new TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: "What tasks you planning to perform?",
                    fillColor: Colors.transparent,
                  ),
                ),
                new TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Input the Type",
                      hintStyle: new TextStyle(color: Colors.grey[400], fontSize: 13.0),
                      icon: new Icon(Icons.archive,color: Colors.grey[400],),
                    ),
                ),
                Divider(height: 0.0),
                InkWell(
                  onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                            new DateTime.now().subtract(new Duration(days: 30)),
                        lastDate:
                            new DateTime.now().add(new Duration(days: 30)),
                      ).then((DateTime date) {
                        this.setState(() {
                          dateTime = date;
                          year = date.year.toString();
                          month = date.month.toString();
                          day = date.day.toString();
                        });
                      }),
                  child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Icon(
                          Icons.calendar_today,
                          color: Colors.grey[400],
                        ),
                        SizedBox(width: 16.0),
                        new Text(
                            dateTime == null
                                ? "Choose Date"
                                : "$year-$month-$day",
                            style: new TextStyle(
                                color: Colors.grey[400], fontSize: 13.0)),
                      ],
                    ),
                  ),
                ),
                Divider(height: 0.0),
              ],
            )),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return new Hero(
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
                  color: Colors.white,
                  size: 30.0,
                ),
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: new Text(
          "New Task",
          style: new TextStyle(color: Colors.black45),
        ),
        leading: new IconButton(
            icon: Icon(Icons.close),
            color: Colors.black45,
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: new Container(
        margin: EdgeInsets.only(top: 50.0),
        child: new Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildForm(context),
            new Expanded(child: new Container()),
            _buildAddButton(context)
          ],
        ),
      ),
    );
  }
}
