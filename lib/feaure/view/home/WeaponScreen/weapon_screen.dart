import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/model/silah.dart';
import 'package:fsc_project/feaure/services/supabase_services.dart';
import 'package:fsc_project/feaure/widget/custom_app_bar.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({Key? key}) : super(key: key);

  @override
  _WeaponScreenState createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
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
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CAppBar(text: "Silahlar"),
      ),
      body: FutureBuilder<List<Silah>>(
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Silah silah = snapshot.data![index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppColor.darkPrimaryRedColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          _getSilahAdiText(silah),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            silah.photo.toString(),
                            fit: BoxFit.contain,
                            height: size.height * .1,
                            width: size.width * .8,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              silah.aciklama.toString(),
                              textAlign: TextAlign.center,
                              style: _getTextStyle(
                                fontSize: 16,
                                color: AppColor.darkPrimaryGreyColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "TÜR // ",
                                  style: _getTextStyle(
                                      fontSize: 18,
                                      color: AppColor.darkPrimaryColor),
                                ),
                                Text(
                                  silah.tur.toString().toUpperCase(),
                                  style: _getTextStyle(
                                      fontSize: 18,
                                      color: AppColor.darkPrimaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}

Widget _getSilahAdiText(Silah silah) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "~ ${silah.isim.toString().toUpperCase()} ~",
        style: _getTextStyle(
          fontSize: 26,
          color: AppColor.darkPrimaryColor,
        ),
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
