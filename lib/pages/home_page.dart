import "package:flutter/material.dart";
import 'package:statelesshelloworld/utils/responsive.dart';
import 'package:statelesshelloworld/widgets/circle.dart';
import 'package:statelesshelloworld/widgets/icon_container.dart';
import 'package:statelesshelloworld/widgets/login_dorm.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsie.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  right: -pinkSize * 0.4,
                  top: -pinkSize * 0.1,
                  child: Circle(
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                  ), // Circle
                ), // Positioned
                Positioned(
                  left: -orangeSize * 0.55,
                  top: -orangeSize * 0.15,
                  child: Circle(
                    size: orangeSize,
                    colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                  ), // Circle
                ), // Positioned
                Positioned(
                  top: pinkSize * 0.35,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size: responsive.wp(17),
                      ), // IconContainer
                      SizedBox(
                        height: responsive.dp(3),
                      ), // SizedBox
                      Text(
                        "Hello again\nWelcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontsize: responsive.dp(1.6),
                        ), // TextStle
                      ), // Text
                    ], // <Widget>[]
                  ), // Column
                ), // Positioned
                LoginForm(), // LoginForm
              ], // <Widget>[]
            ), // Stack
          ), // Container,
        ),
      ), // GestureDetector
    ); // Scaffold
  }
}
