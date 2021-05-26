// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// class testing extends StatefulWidget {
//   @override
//   _testingState createState() => _testingState();
// }

// class _testingState extends State<testing> {
//   WebViewController _controller;

//   String name;
//   double age;
//   String gender;
//   String email;

//   final firestoreInstance = FirebaseFirestore.instance;
//   final User user = auth.currentUser;

//   void nPressed() {
//     final firestoreInstance = FirebaseFirestore.instance;
//     firestoreInstance
//         .collection("MedHelp")
//         .doc("Patient")
//         .collection(user.uid)
//         .get()
//         .then((querySnapshot) {
//       querySnapshot.docs.forEach((result) {
//         print(result.data());
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TextButton(
//           onPressed: () {
//             nPressed();
//           },
//           child: Column(
//             children: [Text("data")],
//           )),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/User_Info/getUserInfo.dart';

import 'package:webview_flutter/webview_flutter.dart';

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  WebViewController _controller;

  String name;
  double age;
  String gender;
  String email;

  final firestoreInstance = FirebaseFirestore.instance;
  final User user = auth.currentUser;

  Map nPressed() {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("MedHelp")
        .doc("Patient")
        .collection(user.uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        return result;
      });
    });
  }

  Map a;

  @override
  Widget build(BuildContext context) {
    return getUserInfo();

    // return Scaffold(
    //   body: TextButton(
    //       onPressed: () {
    //         a = nPressed();
    //         print(a);
    //       },
    //       child: Column(
    //         children: [Text("data")],
    //       )),
    // );
  }
}
