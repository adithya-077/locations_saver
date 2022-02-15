import 'dart:io';

class LocationLongnLat {
  final double longitude;
  final double latitude;
  String address;

  LocationLongnLat(
      {required this.latitude,
      required this.longitude,
      this.address = "not provided"});
}

class Locations {
  final String locationName;
  final String id;
  final LocationLongnLat? locationCred;
  final File? locationImage;

  Locations(
      {required this.id,
      required this.locationCred,
      required this.locationImage,
      required this.locationName});
}
