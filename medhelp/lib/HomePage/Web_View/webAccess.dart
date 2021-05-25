import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webAccess extends StatefulWidget {
  String url;
  String pageName;
  webAccess(String pageName, String url) {
    this.url = url;
    this.pageName = pageName;
  }

  @override
  _webAccessState createState() => _webAccessState();
}

class _webAccessState extends State<webAccess> {
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
        title: Text(widget.pageName),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
