import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/model/karakter.dart';
import 'package:fsc_project/feaure/services/supabase_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fsc_project/feaure/view/home/CharacterScren/character_detail.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late SupabaseServices _services;
  @override
  void initState() {
    _services = SupabaseServices();
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
      body: FutureBuilder<List<Karakter>>(
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
                        Karakter karakter = snapshot.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColor.darkPrimaryColor,
                            border: Border.all(
                              color: AppColor.darkPrimaryRedColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: size.width * .6,
                                height: size.height * .065,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColor.darkPrimaryRedColor,
                                  border: Border.all(
                                      color: AppColor.darkPrimaryGreyColor,
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  karakter.isim.toString().toUpperCase(),
                                  style: getTextStyle(
                                      fontsize: 32,
                                      color: AppColor.darkPrimaryColor),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                karakter.photo.toString(),
                                fit: BoxFit.cover,
                                height: size.height * .55,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: AppColor.darkPrimaryGreyColor,
                                      width: 1),
                                  primary: AppColor.darkPrimaryColor,
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
                                                  karakter: karakter)));
                                },
                                child: Text(
                                  "Detaylar",
                                  style: getTextStyle(
                                      fontsize: 28,
                                      color: AppColor.darkPrimaryRedColor),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: true,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        height: size.height * .82,
                        aspectRatio: .1,
                        initialPage: 0,
                      ),
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

TextStyle getTextStyle({required double fontsize, required Color color}) =>
    TextStyle(
        color: color,
        fontFamily: "Comforta",
        fontSize: fontsize,
        fontWeight: FontWeight.bold);
