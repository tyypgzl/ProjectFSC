import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/model/karakter.dart';
import 'package:supabase/supabase.dart';

class SupabaseServices {
  final supabase = SupabaseClient(ApiConst.apiURL, ApiConst.apiKey);

  Future<List<Karakter>> getKarakter() async {
    final response = await supabase.from("character").select().execute();

    if (response.status == 200) {
      var karakterList = <Karakter>[];
      for (var element in (response.data as List)) {
        Karakter karakter = Karakter.fromJson(element);
        karakterList.add(karakter);
      }
      return karakterList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }
}
