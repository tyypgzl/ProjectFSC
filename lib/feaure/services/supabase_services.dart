import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/model/harita.dart';
import 'package:fsc_project/feaure/model/karakter.dart';
import 'package:fsc_project/feaure/model/silah.dart';
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

  Future<List<Silah>> getSilah() async {
    final response = await supabase.from("weapon").select().execute();

    if (response.status == 200) {
      var silahList = <Silah>[];
      for (var element in (response.data as List)) {
        Silah silah = Silah.fromJson(element);
        silahList.add(silah);
      }
      return silahList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }

  Future<List<Harita>> getHarita() async {
    final response = await supabase.from("map").select().execute();

    if (response.status == 200) {
      var haritaList = <Harita>[];
      for (var element in (response.data as List)) {
        Harita harita = Harita.fromJson(element);
        haritaList.add(harita);
      }
      return haritaList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }
}
