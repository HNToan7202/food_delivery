// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../../core/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/src/places.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  Future<void> placeAutoComplete(String query) async {}

  Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => pickPlaceMark;

  List<Prediction> _predictionList = [];

  Future<http.Response> getLocationData(String text) async {
    http.Response response;

    response = await http.get(
      Uri.parse(
          "http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=$text"),
      headers: {"Content-Type": "application/json"},
    );

    print(jsonDecode(response.body));
    return response;
  }

  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text != null && text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is " + data["status"]);
      if (data['status'] == 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text("Thêm địa chỉ mới",
            style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              child: InputDefault(
                onChanged: (p0) {
                  searchLocation(context, p0);
                  setState(() {});
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Nhập địa chỉ",
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: _predictionList.length,
                  itemBuilder: ((context, index) {
                    return LocationListTile(
                      location: _predictionList[index].description!,
                      press: () {
                        Navigator.pop(
                            context, _predictionList[index].description);
                      },
                    );
                  })),
            ),
          ],
        ),
      ),
    ));
  }
}

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    super.key,
    required this.location,
    required this.press,
  });

  final String location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          leading: const Icon(Icons.location_on_outlined),
          title: Text(location),
        ),
        const Divider(),
      ],
    );
  }
}
