import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Gender { MALE, FEMALE, OTHER }

class setupProfile extends StatefulWidget {
  @override
  _setupProfileState createState() => _setupProfileState();
}

//To be included in splash.dart
final FirebaseAuth auth = FirebaseAuth.instance;

class _setupProfileState extends State<setupProfile> {
  int _currentStep = 0;
  Gender _genderValue = Gender.MALE;

  final _formkey = GlobalKey<FormState>();
  String gender = "Male";

  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController emailID = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController residence = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController additionalInfo = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController emergencyContact = TextEditingController();
  TextEditingController landline = TextEditingController();
  TextEditingController phone = TextEditingController();
  final User user = auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_outlined))),
        title: Text("Setup Profile"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.apps_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "General Info",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //first form field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
//hintText: 'What do people call you?',
                      labelText: 'First Name *',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: fname,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
//hintText: 'What do people call you?',
                      labelText: 'Last Name *',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: lname,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    // 2nd form field
                    controller: dob,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth *',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      //color: Colors.amber,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      //4th field
                      value: gender,
                      //elevation: 5,
                      isExpanded: true,
                      items: <String>['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Gender",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Address Info",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //3rd form field
                    controller: residence,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      //hintText: 'Where do you live?',
                      labelText: 'Residence *',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Pincode',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: pincode,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: emailID,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Contact Info",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile No.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: phone,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Emergency Contact Number',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: emergencyContact,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.how_to_reg_sharp,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Health Related Info",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Height',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    controller: height,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'Weight'),
                    controller: weight,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some value!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'Any health problem to mention'),
                    controller: additionalInfo,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                        //var firebaseUser = FirebaseAuth.instance.currentUser;  //use firebaseUser.uid instead of "Yash"
                        firestoreInstance
                            .collection("MedHelp")
                            .doc("Patient")
                            .collection(user.uid)
                            .doc("PersonalDetails")
                            .set({
                          "FirstName": fname.text,
                          "LastName": lname.text,
                          "Email": emailID.text,
                          "dob": dob.text,
                          "gender": gender,
                          "contact": {
                            "address": {
                              "residence": residence.text,
                              "pincode": pincode.text,
                            },
                            "phone": phone.text,
                            "emergencyContact": emergencyContact.text
                          },
                          "medicalInfo": {
                            "height": height.text,
                            "weight": weight.text,
                            "additionalInfo": additionalInfo.text,
                            "reason": reason.text,
                          },
                        }).then((_) {
                          print('success');
                        });
                      },
                      child: Text('Submit')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
