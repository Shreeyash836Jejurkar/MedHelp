import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medhelp/Components/Authentication/loginPage.dart';
import 'package:medhelp/Components/Authentication/signupPage.dart';
import 'package:medhelp/Components/Authentication/splash.dart';
import 'package:medhelp/Components/Authentication/startPage.dart';
import 'package:medhelp/Components/getStarted.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/BottomMenu/settings.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Chat_Bot/chatBot.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Map_Feature/application_bloc.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Map_Feature/mapFeature.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Setup_Profile/setupProfile.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/User_Info/medicalHistory.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/User_Info/shareInfo.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/communityForum.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/covid19India/covid19InfoIn.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/patientsDashboard.dart';
import 'package:medhelp/testing/testing.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
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
          '/splashPage': (context) => splash(),
          '/startPage': (context) => startPage(),
          '/loginPage': (context) => loginPage(),
          '/signupPage': (context) => signupPage(),
          '/patientsDashboard': (context) => patientsDashboard(),
          '/mapFeature': (context) => mapFeature(),
          '/shareInfo': (context) => shareInfo(),
          '/chatBot': (context) => chatBot(),
          '/covid19InfoIn': (context) => covid19InfoIn(),
          '/setupProfile': (context) => setupProfile(),
          '/medicalHistory': (context) => medicalHistory(),
          '/settingsPage': (context) => settingsPage(),
          '/communityForum': (context) => communityForum(),

          // testing purpose
          // '/testing': (context) => testing(),
        },
      ),
    );
  }
}
