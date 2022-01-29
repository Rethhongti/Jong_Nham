import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jong_nham/views/pages/search_page/widget/search_option_widget.dart';
import '../../../app_index.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var flipController = FlipCardController();
  // late GoogleMapController mapController;
  Completer<GoogleMapController> mapController = Completer();

  bool isShowList = true;
  bool isSearch = false;
  var searchTextController = TextEditingController();

  Set<Marker> marker = {};

  late List<Map<String, dynamic>> location = [
    {
      "placeName": "Brown Coffee Pencil",
      "latLong": LatLng(11.5577252, 104.9208966)
    },
    {
      "placeName": "7-Eleven Chroy Changvar",
      "latLong": LatLng(11.6439789, 104.913934)
    },
    {
      "placeName": "Temple Coffee n Bakery",
      "latLong": LatLng(11.5537806, 104.9255958)
    },
    {
      "placeName": "KOI the Russey Keo",
      "latLong": LatLng(11.6090581, 104.9172941)
    },
  ];

  @override
  void initState() {
    for (int i = 0; i < location.length; i++) {
      marker.add(
          Marker(
            markerId: MarkerId("$i"),
            position: location[i]["latLong"],
            infoWindow: InfoWindow(
              title: location[i]["placeName"],
              snippet: "Coffee Shop",
            )
          ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JongNhamAppColors.MAINCOLOR,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: SearchTextField(
          controller: searchTextController,
          onSubmitted: (value) {
            if(value.isNotEmpty){
              setState(() {
                isSearch = true;
                isShowList = true;
              });
            }else{
              setState(() {
                isSearch = false;
              });
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isShowList = !isShowList;
                });
                flipController.toggleCard();
              },
              child: Icon(
                isShowList ? Icons.public : Icons.list,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: isSearch ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            color: Colors.black87,
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: const [
                Expanded(
                  child: SearchOptionWidget(
                    optionName: "Filter",
                    isFilter: true,
                  ),
                ),
                Expanded(
                  child: SearchOptionWidget(
                    optionName: "Ranking",
                  ),
                ),
                Expanded(
                  child: SearchOptionWidget(
                    optionName: "View",
                  ),
                ),
                Expanded(
                  child: SearchOptionWidget(
                    optionName: "Price",
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "227 restaurants found",
                    style: TextStyle(color: JongNhamAppColors.LIGHT_GRAY),
                  ),
                ),
              ),
            ],
          ),

          //Search Result Body
          Expanded(
            child: FlipCard(
              controller: flipController,
              direction: FlipDirection.HORIZONTAL,
              flipOnTouch: false,
              front: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ShopListCard();
                },
              ),
              back: Stack(
                children: [
                  Container(
                    color: Colors.teal,
                    child: GoogleMap(
                      markers: marker,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      onMapCreated: (controller) async{
                        mapController.complete(controller);
                        final map = await mapController.future;
                        map.showMarkerInfoWindow(MarkerId("0"));
                      },
                      initialCameraPosition: CameraPosition(
                          target: location[0]["latLong"], zoom: 15.0),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        viewportFraction: 1,
                        height: 90,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) async{
                          final map = await mapController.future;
                          map.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: location[index]["latLong"],
                                  zoom: 15)));
                          map.showMarkerInfoWindow(MarkerId("$index"));
                        },
                      ),
                      items: [
                        ...location.map(
                          (e) => RestaurantMapWidget(
                            name: e["placeName"],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ) : Container(),
    );
  }
}
