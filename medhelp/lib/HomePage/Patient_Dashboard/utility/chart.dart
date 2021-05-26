import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineReportChart extends StatelessWidget {
  Color getColor;
  LineReportChart(Color getColor) {
    this.getColor = getColor;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                  spots: Spots(getColor),
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                  colors: [getColor])
            ]),
      ),
    );
  }
}

Spots(Color getColor) {
  if (getColor == Colors.blue) {
    return getSpots1();
  } else if (getColor == Colors.red) {
    return getSpots2();
  } else if (getColor == Colors.green) {
    return getSpots3();
  } else {
    return getSpots4();
  }
}

List<FlSpot> getSpots1() {
  return [
    FlSpot(0, .5),
    FlSpot(1, 1.5),
    FlSpot(2, .5),
    FlSpot(3, .7),
    FlSpot(4, .2),
    FlSpot(5, 2),
    FlSpot(6, 1.5),
    FlSpot(7, 1.7),
    FlSpot(8, 1),
    FlSpot(9, .8),
    FlSpot(10, .5),
    FlSpot(11, 2.65),
  ];
}

List<FlSpot> getSpots2() {
  return [
    FlSpot(0, .5),
    FlSpot(1, 1.5),
    FlSpot(2, .5),
    FlSpot(3, .7),
    FlSpot(4, .2),
    FlSpot(5, .1),
    FlSpot(6, 6),
    FlSpot(7, 1.7),
    FlSpot(8, 1),
    FlSpot(9, 2.8),
    FlSpot(10, 2.5),
    FlSpot(11, 9),
  ];
}

List<FlSpot> getSpots3() {
  return [
    FlSpot(0, .5),
    FlSpot(1, 1.5),
    FlSpot(2, .5),
    FlSpot(3, .7),
    FlSpot(4, .2),
    FlSpot(5, .2),
    FlSpot(6, 1.5),
    FlSpot(7, 2.7),
    FlSpot(8, 1),
    FlSpot(9, 3.8),
    FlSpot(10, 4.5),
    FlSpot(11, 6.65),
  ];
}

List<FlSpot> getSpots4() {
  return [
    FlSpot(0, .5),
    FlSpot(1, .7),
    FlSpot(2, .9),
    FlSpot(3, 1.1),
    FlSpot(4, .7),
    FlSpot(5, 1.2),
    FlSpot(6, 1.5),
    FlSpot(7, .9),
    FlSpot(8, 1),
    FlSpot(9, 1.8),
    FlSpot(10, 1.5),
    FlSpot(11, 2.65),
  ];
}
