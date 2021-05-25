import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import 'Services/geolocator_services.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = geolocatorService();

  //for curr location
  Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
