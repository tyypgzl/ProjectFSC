import 'dart:io';
import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/view/onboardScreen/model/onboard_model.dart';
import 'package:supabase/supabase.dart';

class OnboardServices {
  final supabase = SupabaseClient(ApiConst.apiURL, ApiConst.apiKey);

  Future<List<Onboard>> fetchOnboard() async {
    var onboarList = <Onboard>[];
    final response = await supabase.from("onboard").select().execute();

    if (response.status == HttpStatus.ok) {
      if (response.data is List) {
        for (var item in response.data) {
          Onboard onboard = Onboard.fromJson(item);
          onboarList.add(onboard);
        }
      }
      return onboarList;
    } else {
      throw Exception("Response Status Error:${response.status}");
    }
  }
}
