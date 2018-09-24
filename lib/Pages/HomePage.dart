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

  @override
  void initState() {
    super.initState();
    _scrollController = new PageController();
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
                  color: Colors.white),
            ),
          ),
          new Text(
            "Looks like feel good",
            style: new TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
                color: Colors.white),
          ),
          new SizedBox(height: 5.0),
          new Text(
            "You have 3 tasks to do today",
            style: new TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _scrollToNext(int index) {
    _scrollController.animateTo(200.0 * 5,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          new AppBar(
            leading: new Icon(Icons.sort),
            centerTitle: true,
            title: new Text(
              "TODO",
              style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 150.0),
            child: new Flex(
              direction: Axis.vertical,
              children: <Widget>[
                _buildWelcomeInfo(context),
                new SizedBox(
                  height: 100.0,
                ),
                new Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                          position: index, controller: _scrollController);
                    },
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 29.0),
                    itemCount: 20,
                    controller: _scrollController,
//                      physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*child: ListView.builder(

                  ),*/
