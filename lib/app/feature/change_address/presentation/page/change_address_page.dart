import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import '../../../../../common/input/round_textfield.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({super.key});

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  GoogleMapController? _controller;
  final locations = const [
    LatLng(10.83395, 106.79095),
  ];

  late List<MarkerData> _customMarkers;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(10.83395, 106.79095),
      // tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker('Everywhere\nis a Widgets', Colors.blue)),
    ];
  }

  _customMarker(String symbol, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Image.asset(
            Assets.images.mapPin.path,
            width: 35,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorScheme.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(Assets.images.btnBack.path, width: 20, height: 20),
        ),
        centerTitle: false,
        title: Text("Change Address",
            style: tStyle.H5(
                color: AppColorScheme.primaryText,
                fontWeight: FontWeight.w800)),
      ),
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: _customMarkers,
        builder: (context, markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            compassEnabled: false,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(
                () => PanGestureRecognizer(),
              )),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: RoundTextfield(
                hintText: "Search Address",
                left: Icon(Icons.search, color: AppColorScheme.primaryText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(children: [
                Image.asset(Assets.images.favIcon.path, width: 35, height: 35),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Choose a saved place",
                    style: TextStyle(
                        color: AppColorScheme.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Image.asset(
                  Assets.images.btnNext.path,
                  width: 15,
                  height: 15,
                  color: AppColorScheme.primaryText,
                )
              ]),
            ),
          ],
        )),
      ),
    );
  }
}
