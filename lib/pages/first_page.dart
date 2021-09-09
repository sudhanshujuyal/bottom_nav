import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  final String? text;

  FirstPage({this.text}) : super();
  // const FirstPag?e(this.text) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('My text $text')),
    );
  }
}
