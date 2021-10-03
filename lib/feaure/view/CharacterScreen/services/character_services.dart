import 'package:fsc_project/core/constants/api_const.dart';
import 'package:fsc_project/feaure/view/CharacterScreen/model/character.dart';
import 'package:supabase/supabase.dart';

class CharacterServices {
  final supabase = SupabaseClient(ApiConst.apiURL, ApiConst.apiKey);

  Future<List<CharacterModel>> getKarakter() async {
    final response = await supabase.from("character").select().execute();

    if (response.status == 200) {
      var karakterList = <CharacterModel>[];
      for (var element in (response.data as List)) {
        CharacterModel karakter = CharacterModel.fromJson(element);
        karakterList.add(karakter);
      }
      return karakterList;
    } else {
      throw Exception("Supabase getting data error:${response.error}");
    }
  }
}
