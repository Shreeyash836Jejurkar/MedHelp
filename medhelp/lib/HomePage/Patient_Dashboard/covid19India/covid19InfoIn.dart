import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Web_View/webAccess.dart';

class covid19InfoIn extends StatefulWidget {
  @override
  _covid19InfoInState createState() => _covid19InfoInState();
}

class _covid19InfoInState extends State<covid19InfoIn> {
  @override
  Widget build(BuildContext context) {
    return webAccess("Covid-19 India", 'https://www.covid19india.org/');
  }
}
