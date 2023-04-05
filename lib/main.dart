import 'package:flutter/material.dart';
import 'package:flutter_blue_app/joystick.dart';

import 'MainPage.dart';

void main() => runApp(new ExampleApplication());

class ExampleApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(home: MainPage());
    return MaterialApp(home: Joystick());
  }
}
