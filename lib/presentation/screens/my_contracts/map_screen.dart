import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter:
              LatLng(51.509364, -0.128928), // Center the map over London
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            // Display map tiles from any source
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.example.app',
            maxNativeZoom:
                19, // Scale tiles when the server doesn't support higher zoom levels
          ),
          RichAttributionWidget(
            // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                //  onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
              ),
              // Also add images...
            ],
          ),
        ],
      ),
    ));
  }
}


// import 'dart:async';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../widgets/customInfoWindow.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   final List<LatLng> latLng = const [
//     LatLng(30.185400, 74.496300),
//     LatLng(30.199510, 74.498100),
//   ];

//   final List<Marker> markers = [];
//   bool showCustomWindow = false;
//   LatLng? currentLatLng;
//   int? selectedIndex;

//   final List<String> images = [
//     'assets/images/image.jpeg',
//     'assets/images/girl1.png',
//   ];

//   final List<Map<String, String>> infoData = [
//     {
//       'title': 'Jason Jones',
//       'subtitle': 'Intermediate',
//       'rate': '\$1,000 - \$2,000',
//     },
//     {
//       'title': 'Sophie Turner',
//       'subtitle': 'Beginner',
//       'rate': '\$500 - \$1,000',
//     },
//   ];

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(30.185400, 74.496300),
//     zoom: 14.4746,
//   );

//   Future<BitmapDescriptor> getCircularMarker(String path, double radius) async {
//     final Uint8List markerImageBytes =
//         await getBytesFromAsset(path, 71.w.toInt(), 71.h.toInt());

//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);

//     final Paint paint = Paint()..isAntiAlias = true;
//     final double size = radius * 2;
//     final Rect rect = Rect.fromLTWH(0.0, 0.0, size, size);

//     final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
//     canvas.clipRRect(rrect);

//     final ui.Image image = await decodeImageFromList(markerImageBytes);
//     paintImage(canvas: canvas, rect: rect, image: image, fit: BoxFit.cover);

//     final ui.Image markerImage = await pictureRecorder.endRecording().toImage(
//           size.toInt(),
//           size.toInt(),
//         );
//     final ByteData? byteData =
//         await markerImage.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();

//     return BitmapDescriptor.fromBytes(resizedMarkerImageBytes);
//   }

//   Future<Uint8List> getBytesFromAsset(
//       String path, int width, int height) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: width, targetHeight: height);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     final ByteData? byteData =
//         await fi.image.toByteData(format: ui.ImageByteFormat.png);
//     return byteData!.buffer.asUint8List();
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     for (int i = 0; i < latLng.length; i++) {
//       final customIcon = await getCircularMarker(images[i], 100.r);

//       markers.add(
//         Marker(
//           markerId: MarkerId(i.toString()),
//           position: latLng[i],
//           icon: customIcon,
//           onTap: () {
//             setState(() {
//               showCustomWindow = true;
//               currentLatLng = latLng[i];
//               selectedIndex = i;
//             });
//           },
//         ),
//       );

//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             myLocationEnabled: true,
//             initialCameraPosition: _kGooglePlex,
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//             markers: Set<Marker>.of(markers),
//             onTap: (LatLng latLng) {
//               setState(() {
//                 showCustomWindow = false;
//               });
//             },
//           ),
//           if (showCustomWindow &&
//               currentLatLng != null &&
//               selectedIndex != null)
//             Positioned(
//               left: MediaQuery.of(context).size.width / 2 - 72.w / 2,
//               top: MediaQuery.of(context).size.height / 2 - 80.h,
//               child: CustomInfoWindow(
//                 title: infoData[selectedIndex!]['title']!,
//                 subtitle: infoData[selectedIndex!]['subtitle']!,
//                 rate: infoData[selectedIndex!]['rate']!,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
