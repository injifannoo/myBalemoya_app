import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceProvider {
  final String fullName;
  final String serviceType;
  final String locationDescription;
  final String phone;
  final LatLng location;
  final String status;
  final String email;
  final String distance;
  final double walletBalance;

  ServiceProvider({
    required this.fullName,
    required this.serviceType,
    required this.phone,
    required this.locationDescription,
    required this.location,
    required this.status,
    required this.email,
    required this.distance,
    required this.walletBalance,
  });
}
