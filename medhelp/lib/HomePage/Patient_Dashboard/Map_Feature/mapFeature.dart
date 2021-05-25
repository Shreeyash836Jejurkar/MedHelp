import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medhelp/Components/dialog.dart';
import 'package:medhelp/Components/shimmer.dart';
import 'package:medhelp/HomePage/Patient_Dashboard/Map_Feature/application_bloc.dart';
import 'package:provider/provider.dart';

import 'Doctors_Info/specialistCategory.dart';

class mapFeature extends StatefulWidget {
  @override
  _mapFeatureState createState() => _mapFeatureState();
}

class _mapFeatureState extends State<mapFeature> {
  MapType mType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mType = MapType.normal;
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body: Stack(
        children: [
          TextField(),
          Container(
            child: (applicationBloc == null)
                ? Scaffold(body: Center(child: CircularProgressIndicator()))
                : GoogleMap(
                    mapType: mType,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currentLocation.latitude,
                            applicationBloc.currentLocation.longitude),
                        zoom: 15),
                  ),
          ),
          Positioned(
            top: 40,
            right: 15,
            left: 15,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 15),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Dialogs.yesAbortDialog(context, 'Alert',
                          'Complete Your Google Cloud Billing to use this feature');
                      // search location
                    },
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.1,
              maxChildSize: 0.8,
              minChildSize: 0.1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.apps_outlined,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Find NearBy",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            specialistCategory(),
                            SizedBox(
                              height: 40,
                            ),
                            shimmerCard()
                          ],
                        )),
                  ),
                );
              })
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.map),
              label: "Mode",
              onTap: () {
                setState(() {
                  mType =
                      mType == MapType.normal ? MapType.hybrid : MapType.normal;
                });
              }),
        ],
      ),
    );
  }
}
