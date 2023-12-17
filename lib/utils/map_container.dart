
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapContainer extends StatefulWidget {
  const MapContainer({super.key});

  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Set the desired height
      width: double.infinity, // Set the desired width
      child: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(
              37.7749, -122.4194), // Initial map position (San Francisco, CA)
          zoom: 12.0,
        ),
      ),
    );
  }
}
