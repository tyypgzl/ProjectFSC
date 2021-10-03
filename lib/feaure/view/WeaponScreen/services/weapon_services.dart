import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/view/WeaponScreen/model/weapon.dart';
import 'package:supabase/supabase.dart';

class WeaponServices {
  final supabase = SupabaseClient(ApiConst.apiURL, ApiConst.apiKey);

  Future<List<WeaponModel>> getSilah() async {
    final response = await supabase.from("weapon").select().execute();

    if (response.status == 200) {
      var silahList = <WeaponModel>[];
      for (var element in (response.data as List)) {
        WeaponModel silah = WeaponModel.fromJson(element);
        silahList.add(silah);
      }
      return silahList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }
}
