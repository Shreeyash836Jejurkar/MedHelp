import 'package:flutter/material.dart';

import 'body.dart';
import 'header.dart';

class patientsDashboard extends StatefulWidget {
  @override
  _patientsDashboardState createState() => _patientsDashboardState();
}

class _patientsDashboardState extends State<patientsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Center(
            child: Text(
          "Patient's Dashboard",
        )),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            covidHeader(),
            SizedBox(
              height: 20,
            ),
            dashboardBody(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              size: 30,
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: 1,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
