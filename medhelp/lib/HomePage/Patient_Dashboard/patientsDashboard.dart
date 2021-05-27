import 'package:flutter/material.dart';
import 'package:medhelp/Components/dialog.dart';

import 'body.dart';
import 'header.dart';

class patientsDashboard extends StatefulWidget {
  final String uid;

  const patientsDashboard({Key key, this.uid}) : super(key: key);

  @override
  _patientsDashboardState createState() => _patientsDashboardState();
}

class _patientsDashboardState extends State<patientsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Icon(null),
        actions: [Icon(null)],
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                //call feature here
                Dialogs.yesAbortDialog(
                    context, 'Alert', 'Do you want to call any ambulance');
              },
              icon: Icon(
                Icons.call,
                size: 30,
              ),
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
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settingsPage');
              },
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
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
