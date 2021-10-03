import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/view/mapSreen/model/map.dart';
import 'package:supabase/supabase.dart';

class MapServices {
  final supabase = SupabaseClient(ApiConst.apiURL, ApiConst.apiKey);

  Future<List<MapModel>> getHarita() async {
    final response = await supabase.from("map").select().execute();

    if (response.status == 200) {
      var haritaList = <MapModel>[];
      for (var element in (response.data as List)) {
        MapModel harita = MapModel.fromJson(element);
        haritaList.add(harita);
      }
      return haritaList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }
}
