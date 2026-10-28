import 'dart:async';

import 'package:creative_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../shared/constant.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(36.2074, 37.1440);

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "asset/images/location.png",
    ).then((icon) {
      sourceIcon = icon;
      setState(() {});
    });
  }

// static Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
//         .buffer
//         .asUint8List();
//   }
  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text("Creative Shop"),
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: sourceLocation, zoom: 18.5),
          markers: {
            Marker(
              icon: sourceIcon,
              markerId: const MarkerId('source'),
              position: sourceLocation,
            ),
          },
        ),
      ),
    );
  }
}
