import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class callFeature extends StatefulWidget {
  _makingPhoneCall() async {
    const url = '000000000';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  _callFeatureState createState() => _callFeatureState();
}

class _callFeatureState extends State<callFeature> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget._makingPhoneCall,
      child: null,
    );
  }
}
