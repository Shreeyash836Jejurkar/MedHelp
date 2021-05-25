import 'package:flutter/material.dart';
import 'package:medhelp/Components/getStarted.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Chat_Bot/chatBot.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Map_Feature/application_bloc.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Map_Feature/mapFeature.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/User_Info/shareInfo.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/covid19India/covid19InfoIn.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/patientsDashboard.dart';
import 'package:medhelp/testing/testing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        title: 'Medhelp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => getStarted(),
          '/patientsDashboard': (context) => patientsDashboard(),
          '/mapFeature': (context) => mapFeature(),
          '/shareInfo': (context) => shareInfo(),
          '/chatBot': (context) => chatBot(),
          '/covid19InfoIn': (context) => covid19InfoIn(),
          '/setupProfile': (context) => setupProfile(),
          '/testing': (context) => testing(), // testing purpose
        },
      ),
    );
  }
}
