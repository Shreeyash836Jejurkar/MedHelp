import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/utility/covidInfo.dart';

class covidHeader extends StatelessWidget {
  const covidHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Covid Information",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                covidInfo("Total Cases", 167595221, Colors.blue),
                covidInfo("Confirmed Cases", 383324, Colors.red),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                covidInfo("Recovered Cases", 104797515, Colors.green),
                covidInfo("Total Deaths", 3483306, Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }
}
