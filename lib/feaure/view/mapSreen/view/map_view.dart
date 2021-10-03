import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/components/appbar/custom_app_bar.dart';
import 'package:fsc_project/feaure/view/mapSreen/model/map.dart';
import 'package:fsc_project/feaure/view/mapSreen/services/map_services.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapServices _services;
  @override
  void initState() {
    _services = MapServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CAppBar(text: "Haritalar"),
      ),
      body: FutureBuilder<List<MapModel>>(
        future: _services.getHarita(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Hata Oluştu"));
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.darkPrimaryRedColor,
                ),
              );
            } else {
              return Container(
                width: size.width,
                height: size.height,
                color: AppColor.darkPrimaryGreyColor,
                child: CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index, realIndex) {
                    MapModel harita = snapshot.data![index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.darkPrimaryColor,
                        border: Border.all(
                            color: AppColor.darkPrimaryRedColor, width: .5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: size.height * .09,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: AppColor.darkPrimaryRedColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                harita.isim.toString().toUpperCase(),
                                style: _getTextStyle(
                                  fontsize: 32,
                                  color: AppColor.darkPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImage(
                                imageUrl: harita.photo.toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return SizedBox(
                                    width: size.width * .5,
                                    height: size.height * .25,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColor.darkPrimaryRedColor,
                                        backgroundColor:
                                            AppColor.darkPrimaryGreyColor,
                                      ),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  harita.aciklama.toString(),
                                  textAlign: TextAlign.center,
                                  style: _getTextStyle(
                                    fontsize: 15,
                                    color: AppColor.darkPrimaryGreyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  options: _carouselOptions(size),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

CarouselOptions _carouselOptions(Size size) => CarouselOptions(
      aspectRatio: 11 / 17,
      enableInfiniteScroll: true,
      disableCenter: true,
      enlargeCenterPage: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlay: false,
      scrollDirection: Axis.vertical,
    );
TextStyle _getTextStyle({required double fontsize, required Color color}) =>
    TextStyle(
        color: color,
        fontFamily: "Comforta",
        fontSize: fontsize,
        fontWeight: FontWeight.bold);
