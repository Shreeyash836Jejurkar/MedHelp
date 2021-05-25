import 'package:flutter/material.dart';
import 'package:medhelp/Components/dialog.dart';
import 'package:medhelp/Components/shimmer.dart';

class shareInfo extends StatefulWidget {
  @override
  _shareInfoState createState() => _shareInfoState();
}

class _shareInfoState extends State<shareInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
            child: Text(
          "User Info",
        )),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Text(
                  'Note: Fill the information in "accounts > setup profile" to access this Feature',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            shimmerCard(),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            offset: Offset(0, 8))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(
                            image:
                                AssetImage("assets/images/recordsHistory.png")),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Medical History',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                'Tap to get your medical history!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/records');
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Information Shared");
          Dialogs.yesAbortDialog(context, 'Alert',
              'Do you want to share the informaion with the respective doctor');
        },
        child: Icon(Icons.share),
      ),
    );
  }
}
