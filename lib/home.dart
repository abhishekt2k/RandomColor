import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  Color colorcode = randomcolorgenerator();
  @override
  Widget build(BuildContext context) {
    var hexcode = colorcode.toString().substring(10, 16);
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Color Generator"),
        backgroundColor: Color(0xFF2980b9),
      ),
      body: Builder(
        builder: (context) => Column(
              children: <Widget>[
                Container(
                  child: Center(
                      child: Tooltip(
                    child: FlatButton(
                      color: Color(0xFFFFFFFF),
                      child: Text("the hex value of the color is $hexcode",
                          style: TextStyle(fontSize: 18.0)),
                      onPressed: () {
                        var snackbar = SnackBar(
                            content: Text("hex value : $hexcode copied!"));
                        Scaffold.of(context).showSnackBar(snackbar);
                        Clipboard.setData(ClipboardData(text: hexcode));
                      },
                    ),
                    message: 'Press the button to copy the hexcode',
                  )),
                  padding: EdgeInsets.only(top: 250.0, bottom: 30.0),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      colorcode = randomcolorgenerator();
                    });
                  },
                  child: Text(
                    "Change the Color",
                    style: TextStyle(fontSize: 19.0),
                  ),
                )
              ],
            ),
      ),
      backgroundColor: colorcode,
    );
  }
}

Color randomcolorgenerator() {
  var rand = Random();
  int rvalue = rand.nextInt(255);
  int gvalue = rand.nextInt(255);
  int bvalue = rand.nextInt(255);
  return Color.fromARGB(255, rvalue, gvalue, bvalue);
}
