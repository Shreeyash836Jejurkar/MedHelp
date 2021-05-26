import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';

class medicalHistory extends StatefulWidget {
  @override
  _medicalHistoryState createState() => _medicalHistoryState();
}

class _medicalHistoryState extends State<medicalHistory> {
  GlobalKey imageKey = GlobalKey();
  final firestoreInstance = FirebaseFirestore.instance;
  final User user = auth.currentUser;

  var map;

  void initState() {
    sState();
  }

  Map sState() {
    var i = 0;
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("MedHelp")
        .doc("Patient")
        .collection(user.uid)
        .doc("MedicalHistory")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        map = documentSnapshot.data();
        return documentSnapshot.data();
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Medical History"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 200,
                      width: 250,
                      child: Image.asset('assets/images/recordsHistory.png')),
                  Expanded(
                      child: Text(
                    "Medical History",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Center(
              child: (map == null)
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(map['name']),
                        SizedBox(height: 5.0),
                        Text(map['patid']),
                        SizedBox(height: 5.0),
                        Text(map['current_treatment']['disease1']['avoid'][0]),
                        SizedBox(height: 5.0),
                        Text(map['current_treatment']['disease1']['medication']
                            [0]),
                        SizedBox(height: 5.0),
                        Text(map['docids'][0]),
                        SizedBox(height: 5.0),
                        Text(map['medical_history']['disease1']['avoid'][0]),
                        SizedBox(height: 5.0),
                        Text(map['medical_history']['disease1']['medications']
                            [0]),
                        SizedBox(height: 5.0),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
