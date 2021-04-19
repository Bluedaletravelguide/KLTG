import 'package:flutter/material.dart';
import 'package:kltheguide/widgets/crosswordWidget.dart';

class CrosswordScreen extends StatefulWidget {
  final String title;
  CrosswordScreen({this.title});

  @override
  _CrosswordScreenState createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends State<CrosswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: CrosswordWidget(),
      ),
    );
  }
}
