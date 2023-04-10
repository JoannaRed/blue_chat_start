/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Joystick extends StatefulWidget {
  Joystick({Key key, this.server}) : super(key: key);
  // create a variable to store the BluetoothDevice


  @override
  // create a state for the widget
  State<Joystick> createState() => _JoystickState();
}

// create class to store the state of the widget
class _JoystickState extends State<Joystick> {
  // create a variable to store the BluetoothConnection

  // create boolean variables to store the state of the connection

  // create a getter to check if the connection is established

  // create a boolean variable to store the state of the disconnection


  // we need to override the initState method to connect to the device
  @override
  void initState() {
    // call the initState method of the parent class

    // call the _connect method to connect to the device

      // print a message to the console

      // store the connection in the connection variable

      // set the state of the connection
      


      // catch any errors
    }

  }

  // create a async method to send messages to the device
  void _sendMessage() async {
    // trim the text

    // check if the text is not empty

      // try to send the message

        // add the message to the output stream

        // wait for the message to be sent

        // catch any errors

        // Ignore error, but notify state

      }
    
  

  // build the widget
  @override
  Widget build(BuildContext context) {
    // return a Scaffold widget

      // set the title of the appbar


      
      // set the body of the widget (GridView provides a grid layout)

        // exemple of a grid item
        Container()
        // exemple of a grid item button to send a message to the device
        IconButton(
          // set the icon of the button
          icon: Icon(Icons.arrow_upward),
          // set the action of the button
          onPressed: () {
            // call the _sendMessage method to send a message to the device

            // print a message to the console
          },
        ) 
  }

 */