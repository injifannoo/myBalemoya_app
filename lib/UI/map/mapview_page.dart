import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_balemoya_app/models/serviceprovider_model.dart';

class MapviewPage extends StatefulWidget {
  final List<ServiceProvider> serviceProviders;
  final ValueChanged<ServiceProvider> onMarkerTapped;

  const MapviewPage({
    super.key,
    required this.serviceProviders,
    required this.onMarkerTapped,
  });

  @override
  _MapviewPageState createState() => _MapviewPageState();
}

class _MapviewPageState extends State<MapviewPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _loadServiceProviders();
  }

  void _loadServiceProviders() {
    setState(() {
      markers.addAll(widget.serviceProviders.map((provider) {
        return Marker(
          markerId: MarkerId(provider.email),
          position: provider.location,
          infoWindow: InfoWindow(
            title: provider.fullName,
            snippet: provider.serviceType,
          ),
          onTap: () => widget.onMarkerTapped(provider),
        );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(9.0207, 38.7597), // Default to Addis Ababa
        zoom: 12.0,
      ),
      markers: markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
