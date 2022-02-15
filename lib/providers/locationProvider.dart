import 'package:flutter/foundation.dart';
import 'package:flutter_application_gg/dataModels/locations.dart';

import 'dart:io';

class LocationProvider with ChangeNotifier {
  final List<Locations> _locItems = [];

  List<Locations> get getlocaItems {
    return [..._locItems];
  }

  void addLocations({
    required File? img,
    required String title,
  }) {
    final newLocation = Locations(
        id: DateTime.now().toString(),
        locationCred: null,
        locationImage: img,
        locationName: title);
    _locItems.add(newLocation);
    notifyListeners();
  }

  void popLastItem() {
    if (_locItems.isEmpty) {
      return;
    }
    _locItems.removeLast();
    notifyListeners();
  }
}
