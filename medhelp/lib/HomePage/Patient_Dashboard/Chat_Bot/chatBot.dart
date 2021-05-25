import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Web_View/webAccess.dart';

class chatBot extends StatefulWidget {
  @override
  _chatBotState createState() => _chatBotState();
}

class _chatBotState extends State<chatBot> {
  @override
  Widget build(BuildContext context) {
    return webAccess("Sirius ChatBot",
        'https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=4a31c873-7b84-4590-a40c-b06233548c2a&serviceInstanceID=90a02b3c-bc31-4879-8fd8-fca73a3a73f9');
  }
}
