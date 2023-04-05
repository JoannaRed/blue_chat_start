import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Joystick extends StatefulWidget {
  Joystick({Key key, this.server}) : super(key: key);

  final BluetoothDevice server;

  //final Function onPressed;

  @override
  State<Joystick> createState() => _JoystickState();
}

class _JoystickState extends State<Joystick> {
  BluetoothConnection connection;
  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();
    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  void _sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }

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
            _sendMessage('forward');
            // Communication.sendMessage('forward');
            print('forward');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            _sendMessage('left');
            print('left');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () {
            _sendMessage('right');
            print('right');
          },
        ),
        Container(),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: () {
            _sendMessage('stop');
            print('stop');
          },
        ),
        Container(),
      ]),
    );
  }
}
