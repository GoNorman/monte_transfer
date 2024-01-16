import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/location_widget.dart';

class FlutterMapScreen extends StatelessWidget {
  final LocationService locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
        future: locationService.getCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else if (snapshot.hasData) {
            LatLng currentPosition = snapshot.data!;
            return FlutterMap(
                options: MapOptions(
                    initialCenter: currentPosition, initialZoom: 17.0),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.niki.app',
                  ),
                  MarkerLayer(markers: [
                    Marker(
                        width: 400,
                        height: 400,
                        point: currentPosition,
                        child: Icon(
                          Icons.assistant_navigation,
                          color: Colors.yellow,
                        )),
                  ]),
                  RichAttributionWidget(attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () async {
                        const url = 'https://openstreetmap.org/copyright';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ]),
                ]);
          } else {
            return Text('Uknown error occurred.');
          }
        });
  }
}
