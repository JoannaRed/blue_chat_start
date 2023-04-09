import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Joystick extends StatefulWidget {
  Joystick({Key key, this.server}) : super(key: key);
  // create a variable to store the BluetoothDevice
  final BluetoothDevice server;

  @override
  // create a state for the widget
  State<Joystick> createState() => _JoystickState();
}

// create class to store the state of the widget
class _JoystickState extends State<Joystick> {
  // create a variable to store the BluetoothConnection
  BluetoothConnection connection;
  // create boolean variables to store the state of the connection
  bool isConnecting = true;
  // create a getter to check if the connection is established
  bool get isConnected => connection != null && connection.isConnected;
  // create a boolean variable to store the state of the disconnection
  bool isDisconnecting = false;

  // we need to override the initState method to connect to the device
  @override
  void initState() {
    // call the initState method of the parent class
    super.initState();
    // call the _connect method to connect to the device
    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      // print a message to the console
      print('Connected to the device');
      // store the connection in the connection variable
      connection = _connection;
      // set the state of the connection
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
      // catch any errors
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  // create a async method to send messages to the device
  void _sendMessage(String text) async {
    // trim the text
    text = text.trim();
    // check if the text is not empty
    if (text.length > 0) {
      // try to send the message
      try {
        // add the message to the output stream
        connection.output.add(utf8.encode(text + "\r\n"));
        // wait for the message to be sent
        await connection.output.allSent;
        // catch any errors
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }

  // build the widget
  @override
  Widget build(BuildContext context) {
    // return a Scaffold widget
    return Scaffold(
      // set the title of the appbar
      appBar: AppBar(
        title: Text('Joystick'),
      ),
      // set the body of the widget (GridView provides a grid layout)
      body: GridView.count(crossAxisCount: 3, children: <Widget>[
        // exemple of a grid item
        Container(),
        // exemple of a grid item button to send a message to the device
        IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () {
            _sendMessage('forward');
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
