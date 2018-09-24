import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design/UI_Elements/TodoCard.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  List<Color> colorList = [
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(232, 129, 109, 1.0),
    Color.fromRGBO(126, 201, 183, 1.0),
  ];
  int colorIndex = 0;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _scrollController = new PageController();
  }

  Widget _buildAppbar() {
    return new Container(
      padding: EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0,bottom: 40.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.sort,
            color: Colors.white70,
          ),
          new Text("TODO",style: new TextStyle(color: Colors.white70,fontWeight: FontWeight.w500,fontSize: 15.0),),
          new Icon(
            Icons.search,
            color: Colors.white70,
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeInfo(BuildContext context) {
    return new Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 55.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: new Text(
              "Hello, Pintaigao",
              style: new TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  color: Colors.white70),
            ),
          ),
          new Text(
            "Looks like feel good",
            style: new TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 15.0,
                color: Colors.white70),
          ),
          new SizedBox(height: 5.0),
          new Text(
            "You have 3 tasks to do today",
            style: new TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 15.0,
                color: Colors.white70),
          ),
        ],
      ),
    );
  }

  void _onBackGoundColorChange(){
    print(random.nextInt(3));
    this.setState(() => colorIndex = random.nextInt(3));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          color: colorList[colorIndex]
        ),
        child: new Container(
//          margin: EdgeInsets.only(top: 150.0),
          child: new Column(
            children: <Widget>[
              _buildAppbar(),
              _buildWelcomeInfo(context),
              new SizedBox(
                height: 100.0,
              ),
              new Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                        position: index, controller: _scrollController,colorChanger:_onBackGoundColorChange);
                  },
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 29.0),
                  itemCount: 20,
                  controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
