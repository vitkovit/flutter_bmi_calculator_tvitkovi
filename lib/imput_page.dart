import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Text('Body Text'),
        ),
        floatingActionButton: Theme(
          data: ThemeData.light(),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        )
    );
  }
}