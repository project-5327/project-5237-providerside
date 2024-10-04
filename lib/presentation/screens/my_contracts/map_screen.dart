import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/color.dart';
import '../../constants/responsive_view.dart';
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
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _desktopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
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
                width: responsive.isMobile || responsive.isTablet ? 165.w : 165,
                height:
                    responsive.isMobile || responsive.isTablet ? 173.h : 173,
                point: markerPosition1,
                child: Column(
                  children: [
                    if (selectedMarker == markerPosition1)
                      ConnectionContainer(
                        h: responsive.isMobile || responsive.isTablet
                            ? 32.h
                            : 32,
                        w: responsive.isMobile || responsive.isTablet
                            ? 165.w
                            : 165,
                        color: Color(0xff4B164C),
                        image: 'assets/icons/Icon.svg',
                        title: 'Connect with Clara 👋',
                      ),
                    SizedBox(height: 5.h),
                    Icon(
                      Icons.circle,
                      color: Color(0xff4B164C),
                      size: responsive.isMobile ? 10.sp : 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMarker = markerPosition1;
                        });
                      },
                      child: Container(
                        width: responsive.isMobile
                            ? 61.w
                            : responsive.isTablet
                                ? 55.0
                                : 40.0,
                        height: responsive.isMobile || responsive.isTablet
                            ? 61.h
                            : 61,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color(0xff4B164C),
                              width: responsive.isMobile ? 3.w : 3),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/images/girl3.png',
                            width: responsive.isMobile
                                ? 71.w
                                : responsive.isTablet
                                    ? 55.0
                                    : 40.0,
                            height: responsive.isMobile || responsive.isTablet
                                ? 71.h
                                : 71,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Marker(
                width: responsive.isMobile || responsive.isTablet ? 165.w : 165,
                height:
                    responsive.isMobile || responsive.isTablet ? 173.h : 300,
                point: markerPosition,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMarker = markerPosition;
                          });
                        },
                        child: Container(
                          width: responsive.isMobile
                              ? 71.w
                              : responsive.isTablet
                                  ? 71.0
                                  : 72.0,
                          height: responsive.isMobile ? 71.h : 71.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: MyColors.btnColor,
                                width: responsive.isMobile ? 3.w : 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              'assets/images/image.jpeg',
                              width: responsive.isMobile
                                  ? 71.w
                                  : responsive.isTablet
                                      ? 71.0
                                      : 72.0,
                              height: responsive.isMobile ? 71.h : 71.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    SizedBox(height: 5.h),
                    Icon(
                      Icons.circle,
                      color: MyColors.btnColor,
                      size: responsive.isMobile ? 8.sp : 10,
                    ),
                    if (selectedMarker == markerPosition)
                      SizedBox(height: 10.h),
                    if (selectedMarker == markerPosition)
                      CustomInfoWindow(
                        color: MyColors.btnColor.withOpacity(0.7),
                        h: responsive.isMobile
                            ? 70.h
                            : responsive.isTablet
                                ? 60.h
                                : 80,
                        w: responsive.isMobile
                            ? 100.w
                            : responsive.isTablet
                                ? 80.w
                                : 80,
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

  _desktopView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Location',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterMap(
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
                    width: 160,
                    height: 174,
                    point: markerPosition,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMarker = markerPosition;
                        });
                      },
                      child: selectedMarker == markerPosition
                          ? Container(
                              height: 174,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: MyColors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 5),
                                  Container(
                                    width: 71,
                                    height: 71,
                                    decoration: BoxDecoration(
                                      color: MyColors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: MyColors.btnColor,
                                        width: responsive.isMobile ? 3.w : 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      child: Image.asset(
                                        'assets/images/image.jpeg',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Icon(Icons.circle,
                                      color: MyColors.btnColor, size: 10.0),
                                  SizedBox(height: 10.h),
                                  CustomInfoWindow(
                                    color: MyColors.btnColor.withOpacity(0.7),
                                    h: 65.0,
                                    w: 130.0,
                                    title: 'Jason Jones',
                                    subtitle: 'Intermediate',
                                    rate: '\$1,000 - \$2,000',
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                  width: 71.0,
                                  height: 71.0,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: MyColors.btnColor,
                                      width: responsive.isMobile ? 3.w : 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.asset(
                                      'assets/images/image.jpeg',
                                      width: 71.0,
                                      height: 71.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Icon(Icons.circle,
                                    color: MyColors.btnColor, size: 10.0),
                              ],
                            ),
                    ),
                  )
                ]),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xffD7DCE0),
              ),
              height: 47,
              width: 280,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: 'Search ',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.lightGrey),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          )
        ]),
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
    final responsive = ResponsiveCheck(context);
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
              height: responsive.isMobile ? 14.h : 14,
              width: responsive.isMobile ? 14.w : 14,
            ),
            SizedBox(width: responsive.isMobile ? 4.w : 4),
            Text(
              title,
              style: TextStyle(
                color: MyColors.white,
                fontSize: responsive.isMobile ? 10.sp : 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
