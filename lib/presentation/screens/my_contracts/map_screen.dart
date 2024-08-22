import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/color.dart';
import '../../widgets/customInfoWindow.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();

  LatLng markerPosition = LatLng(51.509364, -0.128928);
  LatLng markerPosition1 = LatLng(54.509364, -1.128928);

  LatLng? selectedMarker;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: markerPosition,
            initialZoom: 13.0,
            onTap: (tapPosition, latLng) {
              setState(() {
                selectedMarker = null;
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(markers: [
              Marker(
                width: 165.w,
                height: 173.h,
                point: markerPosition1,
                // builder: (ctx) => GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedMarker = markerPosition1;
                //     });
                //   },
                child: Column(
                  children: [
                    if (selectedMarker == markerPosition1)
                      ConnectionContainer(
                        h: 32.h,
                        w: 165.w,
                        color: Color(0xff4B164C),
                        image: 'assets/icons/Icon.svg',
                        title: 'Connect with Clara 👋',
                      ),
                    SizedBox(height: 5.h),
                    Icon(
                      Icons.circle,
                      color: Color(0xff4B164C),
                      size: 10.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMarker = markerPosition1;
                        });
                      },
                      child: Container(
                        width: 61.w,
                        height: 61.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xff4B164C), width: 3.w),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/images/girl3.png',
                            width: 71.w,
                            height: 71.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Marker(
                width: 145.w,
                height: 163.h,
                point: markerPosition,
                // builder: (ctx) => GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedMarker = markerPosition;
                //     });
                //   },
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMarker = markerPosition;
                        });
                      },
                      child: Container(
                        width: 71.w,
                        height: 71.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: MyColors.btnColor, width: 3.w),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/images/image.jpeg',
                            width: 71.w,
                            height: 71.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Icon(
                      Icons.circle,
                      color: MyColors.btnColor,
                      size: 10.sp,
                    ),
                    if (selectedMarker == markerPosition)
                      SizedBox(height: 10.h),
                    if (selectedMarker == markerPosition)
                      CustomInfoWindow(
                        color: MyColors.btnColor.withOpacity(0.7),
                        h: 65.h,
                        w: 144.w,
                        title: 'Jason Jones',
                        subtitle: 'Intermediate',
                        rate: '\$1,000 - \$2,000',
                      ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class ConnectionContainer extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final double h;
  final double w;

  const ConnectionContainer({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.h,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 14.h,
              width: 14.w,
            ),
            SizedBox(width: 4.w),
            Text(
              title,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
