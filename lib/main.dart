
import 'package:flutter/material.dart';
import 'package:test/form_radio_button.dart';
import 'package:test/popup_notification.dart';
import 'upload_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormRadioButton(),
    );
  }
}



