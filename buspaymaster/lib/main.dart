
import 'package:flutter/material.dart';
import 'package:buspay/screens/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusPay',
      theme: ThemeData(
        dividerColor: Colors.grey[500],
      ),
      home: Login(),
    );
  }
}

