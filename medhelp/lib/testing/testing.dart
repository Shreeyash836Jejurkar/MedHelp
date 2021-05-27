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

  var docid;

  List snap;

  nPressed3() async {
    final firestoreInstance = FirebaseFirestore.instance;
    await firestoreInstance.collection("Doctor").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        snap.add(result.data);
        print(snap);
      });
    });
  }

  Map a;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Doctor").snapshots(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot doctor = snapshot.data.documents[index];
            return ListTile(
              leading: Text(doctor['docid']),
            );
          },
        );
      },
    ));
  }
}
