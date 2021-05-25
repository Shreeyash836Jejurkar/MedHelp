import 'package:flutter/material.dart';

import 'chart.dart';

class covidInfo extends StatelessWidget {
  String about;
  int count;
  Color color;

  covidInfo(String about, int count, Color color) {
    this.about = about;
    this.count = count;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 10, offset: Offset(0, 8))
            ]),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                about,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(child: LineReportChart(color))
                ],
              )
            ],
          ),
        ));
  }
}
