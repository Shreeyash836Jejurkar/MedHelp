import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/patientsDashboard.dart';

class splash extends StatefulWidget {
  splash({Key key}) : super(key: key);
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  initState() {
    FirebaseAuth.instance.authStateChanges().listen((currentUser) => {
          if (currentUser == null)
            {Navigator.pushNamed(context, '/login')}
          else
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => patientsDashboard(
                            //title: result["fname"] + "'s Tasks",
                            uid: currentUser.uid,
                          ))).catchError((err) => print(err))
            }
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/loginPage');
        },
        child: Text("Ok"),
      )),
    );
  }
}
