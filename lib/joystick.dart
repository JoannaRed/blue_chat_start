import 'package:flutter/material.dart';
import 'package:flutter_blue_app/communication.dart';

class Joystick extends StatefulWidget {
  const Joystick({Key key, this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  State<Joystick> createState() => _JoystickState();
}

class _JoystickState extends State<Joystick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joystick'),
      ),
      body: GridView.count(crossAxisCount: 3, children: <Widget>[
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () {
            widget.onPressed('forward');
            // Communication.sendMessage('forward');
            print('forward');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            print('left');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () {
            print('right');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: () {
            print('stop');
          },
        ),
        Container(),
      ]),
    );
  }
}
