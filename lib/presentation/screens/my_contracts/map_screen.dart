// import 'dart:async';

// import 'package:flutter/material.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const CameraPosition _zaGooglePlex = CameraPosition(
//     target: LatLng(26.9124336, 75.7872709),
//     zoom: 14.4746,
//   );

//   List<Marker> _marker = [];
//   final List<Marker> _list = [
//     const Marker(
//       markerId: MarkerId('1'),
//       position: LatLng(26.9124336, 75.7872709),
//       infoWindow: InfoWindow(title: 'My current location'),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _marker.addAll(_list);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GoogleMap(
//           // myLocationEnabled: true,
//           // compassEnabled: true,
//           // mapType:MapType.normal,
//           initialCameraPosition: _zaGooglePlex,
//           markers: Set<Marker>.of(_marker),
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.location_disabled_outlined),
//         onPressed: () async {
//           GoogleMapController controller = await _controller.future;
//           controller.animateCamera(CameraUpdate.newCameraPosition(
//             const CameraPosition(
//               target: LatLng(26.9124336, 75.7872709),
//               zoom: 14,
//             ),
//           ));
//         },
//       ),
//     );
//   }
// }
