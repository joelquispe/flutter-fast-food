import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommercesmall/src/common/constants/const.dart';
import 'package:ecommercesmall/src/core/models/prediction.model.dart';
import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_button.widget.dart';
import 'package:ecommercesmall/src/ui/global_widgets/custom_textField.widget.dart';
import 'package:ecommercesmall/src/ui/layouts/main.layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressScreen extends StatefulWidget {
  const PickAddressScreen({super.key});

  @override
  State<PickAddressScreen> createState() => _PickAddressScreenState();
}

class _PickAddressScreenState extends State<PickAddressScreen> {
  final dio = Dio();
  Completer<GoogleMapController> googleMapController = Completer();
  Set<Marker> markers = {};
  String selectedAddress = "";
  TextEditingValue? valueAddress;
  TextEditingController tfAddress = TextEditingController();
  
  addMarker(LatLng position) {
    markers.clear();
    final marker = Marker(
      markerId: MarkerId(
        position.toString(),
      ),
      position: position,
      infoWindow: InfoWindow(title: selectedAddress),
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark placemark = placemarks.first;
      String address = "${placemark.street} ,${placemark.locality}";
      setState(() {
        selectedAddress = address;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(["Fallo al obtener la dirección"]);
    }
  }

  Future<List<dynamic>?> getAddressFromApi(String value) async {
    try {
      var url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$API_KEY_GOOGLE_MAPS";
      final response = await dio.get(url);

      return response.data['predictions'] as List<dynamic>;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: "Seleccione su dirección",
      isPadding: false,
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              googleMapController.complete(controller);
            },
            onTap: (position) async {
              await getAddressFromLatLng(position);
              addMarker(position);
              setState(() {
                tfAddress.text = selectedAddress;
              });
              // print(valueAddress.text);
            },
            markers: markers,
            initialCameraPosition: const CameraPosition(
              target: LatLng(-12.077688800756603, -77.08192083729611),
              zoom: 15,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Autocomplete(
                    initialValue: TextEditingValue(text: tfAddress.text),
                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                      tfAddress = textEditingController;
                      return CustomTextFieldWidget(
                        label: "Dirección",
                        controller: textEditingController,
                        hintText: "Dirección",
                        focusNode: focusNode,
                        maxLines: 1,
                      );
                    },
                    displayStringForOption: (option) {
                      return option.description;
                    },
                    onSelected: (option) async {
                      selectedAddress = option.description;
                      final url =
                          "https://maps.googleapis.com/maps/api/place/details/json?place_id=${option.place_id}&fields=geometry&key=$API_KEY_GOOGLE_MAPS";
                      final response = await dio.get(url);
                      final location = response.data['result']['geometry']['location'];

                      markers.clear();
                      markers.add(
                        Marker(
                          markerId: MarkerId(
                            location['lat'].toString(),
                          ),
                          position: LatLng(
                            location['lat'],
                            location['lng'],
                          ),
                        ),
                      );
                      googleMapController.future.then((value) {
                        value.animateCamera(
                          CameraUpdate.newLatLngZoom(
                              LatLng(
                                location['lat'],
                                location['lng'],
                              ),
                              14),
                        );
                      });
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          shape: OutlineInputBorder(),
                          child: Container(
                            height: 52.0 * options.length,
                            child: ListView.builder(
                              shrinkWrap: false,
                              itemCount: options.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                PredictionModel prediction = options.toList()[index];
                                return ListTile(
                                  onTap: () {
                                    onSelected(prediction);
                                  },
                                  title: Text(prediction.description),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) async {
                      final respPredictions = await getAddressFromApi(textEditingValue.text);
                      List<PredictionModel> predictions = [];
                      if (respPredictions != null) {
                        for (var element in respPredictions) {
                          PredictionModel predictionModel = PredictionModel(place_id: element['place_id'], description: element['description']);
                          predictions.add(predictionModel);
                        }
                        return predictions;
                      }
                      return predictions;
                    },
                  ),
                  // CustomTextFieldWidget(
                  //   label: "Dirección",
                  //   hintText: "Dirección",
                  //   controller: tfAddress,
                  //   maxLines: 1,
                  //   onChanged: (value) {
                  //     getAddressFromApi(value);
                  //   },
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonWidget(
                    text: "Confirmar",
                    onTap: () {
                      
                      Navigator.pop(context, selectedAddress);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
