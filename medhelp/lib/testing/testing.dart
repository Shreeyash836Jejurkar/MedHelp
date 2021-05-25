import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_outlined))),
        title: Text("Testing 1234"),
        centerTitle: true,
      ),
      body: Text("Testing1234"),
    );
  }
}
