import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhelp/Components/shimmer.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';

class getUserInfo extends StatefulWidget {
  @override
  _getUserInfoState createState() => _getUserInfoState();
}

class _getUserInfoState extends State<getUserInfo> {
  Map map;
  final firestoreInstance = FirebaseFirestore.instance;
  final User user = auth.currentUser;

  Future getInfo() async {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("MedHelp")
        .doc("Patient")
        .collection(user.uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        map = result.data();
        return map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return shimmerCard();
          default:
            return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10,
                          offset: Offset(0, 8))
                    ]),
                child: Column(
                  children: [
                    Text(map['FirstName']),
                    SizedBox(height: 5.0),
                    Text(map['LastName']),
                    SizedBox(height: 5.0),
                    Text(map['Email']),
                    SizedBox(height: 5.0),
                    Text(map['contact']['address']['residence']),
                    SizedBox(height: 5.0),
                    Text(map['contact']['address']['pincode']),
                    SizedBox(height: 5.0),
                    Text(map['contact']['emergencyContact']),
                    SizedBox(height: 5.0),
                    Text(map['contact']['phone']),
                    SizedBox(height: 5.0),
                    Text(map['dob']),
                    SizedBox(height: 5.0),
                    Text(map['gender']),
                    SizedBox(height: 5.0),
                    Text(map['medicalInfo']['height']),
                    SizedBox(height: 5.0),
                    Text(map['medicalInfo']['weight']),
                    SizedBox(height: 5.0),
                    Text(map['medicalInfo']['additionalInfo']),
                    SizedBox(height: 5.0),
                  ],
                ));
        }
      },
    );
  }
}
