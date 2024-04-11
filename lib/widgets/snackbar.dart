import 'package:flutter/material.dart';

class MyMessageHandler {
  static void showSnackBar(var _scaffolkey, String message) {
    _scaffolkey.currentState!.hideCurrentSnackBar();
    _scaffolkey.currentState!.showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        )));
  }
}
