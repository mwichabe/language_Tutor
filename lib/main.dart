import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/logIn.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
    initialRoute: '/login',
        routes: {
      '/login': (context)=> const LogIn(),
        },
  ));
}


