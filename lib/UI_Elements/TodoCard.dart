import 'package:flutter/material.dart';
import 'package:flutter_design/Pages/TodoDetail.dart';

class TodoCard extends StatelessWidget {
  final int position;
  final ScrollController controller;
  final colorChanger;

  TodoCard({this.position, this.controller,this.colorChanger});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(left: 10.0, bottom: 50.0, right: 10.0),
        width: screenSize.width - 110.0,
        height: screenSize.height / 2.1,
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.0),
                    child: new Text(
                      "Date",
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 8.0)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                    child: new CircleAvatar(
                                      child: Icon(Icons.person),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.grey,
                                    ),
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.black, // border color
                                      shape: BoxShape.circle,
                                    )),
                                new Container(
//                              alignment: Alignment(0.0, -3.0),
                                  child: new CircleAvatar(
                                    child: new Icon(
                                      Icons.more_vert,
                                      size: 22.0,
                                    ),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.grey,
                                  ),
                                  width: 45.0,
                                  height: 45.0,
                                ),
                              ],
                            ),
                            new Container(
                              alignment: Alignment.topLeft,
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("12 Tasks"),
                                  new Text("Work"),
                                  new Text("Slider Goes here"),
                                ],
                              ),
                            ),
                            /*

                              onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return TodoDetail();
                                  }))),
                        )*/
                          ],
                        )),
                  ),
                ],
              ),
            ),
            new Container(
              height: screenSize.height / 2.1,
              child: new GestureDetector(
                onTap: (){
                  controller.animateTo(
                      (screenSize.width - 90.5) * position,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                  colorChanger();
                },
                onVerticalDragEnd: (DragEndDetails detail) {
                  if (detail.primaryVelocity < -300) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return TodoDetail();
                    }));
                  }
                },
              ),
            )
          ],
        ));
  }
}
