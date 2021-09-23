import 'package:flutter/material.dart';
import 'package:fsc_project/feaure/widget/custom_app_bar.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({Key? key}) : super(key: key);

  @override
  _WeaponScreenState createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CAppBar(text: "Silahlar"),
      ),
      body: Container(),
    );
  }
}
