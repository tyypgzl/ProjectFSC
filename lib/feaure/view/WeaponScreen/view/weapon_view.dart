import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/components/appbar/custom_app_bar.dart';
import 'package:fsc_project/feaure/view/WeaponScreen/model/weapon.dart';
import 'package:fsc_project/feaure/view/WeaponScreen/services/weapon_services.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({Key? key}) : super(key: key);

  @override
  _WeaponScreenState createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  late WeaponServices _services;
  @override
  void initState() {
    _services = WeaponServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CAppBar(text: "Silahlar"),
      ),
      body: FutureBuilder<List<WeaponModel>>(
        future: _services.getSilah(),
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
                      WeaponModel silah = snapshot.data![index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.darkPrimaryColor,
                          border: Border.all(
                            color: AppColor.darkPrimaryRedColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            _getSilahAdiText(silah),
                            const SizedBox(
                              height: 12,
                            ),
                            _getSilahPhoto(silah, size),
                            const SizedBox(
                              height: 12,
                            ),
                            _getSilahAciklama(silah),
                            const Spacer(),
                            _getSilahTur(silah, size),
                          ],
                        ),
                      );
                    },
                    options: _carouselOptions(size)),
              );
            }
          }
        },
      ),
    );
  }
}

Widget _getSilahTur(WeaponModel silah, Size size) => Container(
      height: size.height * .067,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColor.darkPrimaryRedColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Text(
        "TÜR // " + silah.tur.toString().toUpperCase(),
        style: _getTextStyle(fontSize: 18, color: AppColor.darkPrimaryColor),
      ),
    );

Widget _getSilahAciklama(WeaponModel silah) => Padding(
      padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
      child: Text(
        silah.aciklama.toString(),
        textAlign: TextAlign.center,
        style: _getTextStyle(
          fontSize: 18,
          color: AppColor.darkPrimaryGreyColor,
        ),
      ),
    );

Widget _getSilahAdiText(WeaponModel silah) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        " ${silah.isim.toString().toUpperCase()} ",
        style: _getTextStyle(
          fontSize: 28,
          color: AppColor.darkPrimaryRedColor,
        ),
      ),
    );

Widget _getSilahPhoto(WeaponModel silah, Size size) => Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(color: AppColor.darkPrimaryColor, width: .2),
        color: AppColor.darkPrimaryGreyColor,
      ),
      child: CachedNetworkImage(
        imageUrl: silah.photo.toString(),
        height: size.height * .13,
        width: size.width * .9,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: AppColor.darkPrimaryRedColor,
            backgroundColor: AppColor.darkPrimaryGreyColor,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );

TextStyle _getTextStyle({
  required double fontSize,
  required Color color,
}) =>
    TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: "Comforta");

CarouselOptions _carouselOptions(Size size) => CarouselOptions(
      enableInfiniteScroll: true,
      disableCenter: false,
      enlargeCenterPage: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlay: false,
      scrollDirection: Axis.vertical,
    );
