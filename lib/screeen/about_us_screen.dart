import 'dart:async';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _KITC = CameraPosition(
    //posicion de la camara(en este caso la ubicacion del tec campus 2 xd)
    target: LatLng(20.5461087, -100.8139196),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      //te lleva a otra ubicacion
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final List<MapType> listMapType = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain
  ];
  //int opMap = 0;
  ValueNotifier<int> opMap = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final circularMenu = CircularMenu(items: [
      CircularMenuItem(
          icon: Icons.home,
          onTap: () {
            // callback
          }),
      CircularMenuItem(icon: Icons.search, onTap: () => opMap.value = 0),
      CircularMenuItem(icon: Icons.settings, onTap: () => opMap.value = 1),
      CircularMenuItem(icon: Icons.star, onTap: () => opMap.value = 2),
      CircularMenuItem(icon: Icons.pages, onTap: () => opMap.value = 3),
    ]);
    return Scaffold(
      body: Stack(children: [
        ValueListenableBuilder(
            valueListenable: opMap,
            builder: (context, value, child) {
              return GoogleMap(
                mapType: listMapType[value],
                initialCameraPosition: _KITC,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            }),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
