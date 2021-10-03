import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/constants/character_const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fsc_project/feaure/view/CharacterScreen/model/character.dart';
import 'package:fsc_project/feaure/view/CharacterScreen/services/character_services.dart';

import 'package:octo_image/octo_image.dart';

import 'character_detail.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late CharacterServices _services;
  @override
  void initState() {
    _services = CharacterServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Ajanlar",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Comforta",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<CharacterModel>>(
        future: _services.getKarakter(),
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
                color: AppColor.darkPrimaryGreyColor,
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index, realIndex) {
                        CharacterModel karakter = snapshot.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColor.darkPrimaryColor,
                            border: Border.all(
                              color: AppColor.darkPrimaryRedColor,
                              width: .2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width * .8,
                                height: size.height * .1,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColor.darkPrimaryRedColor
                                      .withOpacity(.8),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(3),
                                    bottomRight: Radius.circular(3),
                                  ),
                                ),
                                child: Text(
                                  karakter.isim.toString().toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: _getTextStyle(
                                      fontsize: 32,
                                      color: AppColor.darkPrimaryColor),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              OctoImage(
                                image: CachedNetworkImageProvider(
                                  karakter.photo.toString(),
                                ),
                                fit: BoxFit.cover,
                                height: size.height * .55,
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                    CharacterConst.photoBlurHash,
                                    fit: BoxFit.cover),
                                errorBuilder: OctoError.icon(
                                    color: AppColor.darkPrimaryRedColor),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: AppColor.darkPrimaryRedColor,
                                      width: .4),
                                  primary: AppColor.darkPrimaryGreyColor,
                                  onPrimary: AppColor.darkPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  fixedSize:
                                      Size(size.width * .6, size.height * .072),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CharacterDetailView(
                                                karakter: karakter)),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Detaylar",
                                      style: _getTextStyle(
                                          fontsize: 28,
                                          color: AppColor.darkPrimaryRedColor),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: AppColor.darkPrimaryRedColor,
                                      size: 40,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: _getCarouselOptions(size),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}

TextStyle _getTextStyle({required double fontsize, required Color color}) =>
    TextStyle(
        color: color,
        fontFamily: "Comforta",
        fontSize: fontsize,
        fontWeight: FontWeight.bold);

CarouselOptions _getCarouselOptions(Size size) => CarouselOptions(
      autoPlay: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      disableCenter: true,
      enlargeCenterPage: true,
      height: size.height * .82,
      aspectRatio: .1,
      initialPage: 0,
    );
