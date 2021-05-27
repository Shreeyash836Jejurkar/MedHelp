import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Web_View/webAccess.dart';

class communityForum extends StatefulWidget {
  @override
  _communityForumState createState() => _communityForumState();
}

class _communityForumState extends State<communityForum> {
  @override
  Widget build(BuildContext context) {
    return webAccess("Community Forum", 'https://patient.info/forums');
  }
}
