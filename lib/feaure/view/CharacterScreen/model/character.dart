class CharacterModel {
  int? id;
  String? isim;
  String? photo;
  String? bio;
  String? rol;
  String? ulke;
  String? skill1;
  String? skill1Url;
  String? skill2;
  String? skill2Url;
  String? skill3;
  String? skill3Url;
  String? ulti;
  String? ultiUrl;

  CharacterModel(
      {this.id,
      this.isim,
      this.photo,
      this.bio,
      this.rol,
      this.ulke,
      this.skill1,
      this.skill1Url,
      this.skill2,
      this.skill2Url,
      this.skill3,
      this.skill3Url,
      this.ulti,
      this.ultiUrl});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    photo = json['photo'];
    bio = json['bio'];
    rol = json['rol'];
    ulke = json['ulke'];
    skill1 = json['skill1'];
    skill1Url = json['skill1Url'];
    skill2 = json['skill2'];
    skill2Url = json['skill2Url'];
    skill3 = json['skill3'];
    skill3Url = json['skill3Url'];
    ulti = json['ulti'];
    ultiUrl = json['ultiUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isim'] = isim;
    data['photo'] = photo;
    data['bio'] = bio;
    data['rol'] = rol;
    data['ulke'] = ulke;
    data['skill1'] = skill1;
    data['skill1Url'] = skill1Url;
    data['skill2'] = skill2;
    data['skill2Url'] = skill2Url;
    data['skill3'] = skill3;
    data['skill3Url'] = skill3Url;
    data['ulti'] = ulti;
    data['ultiUrl'] = ultiUrl;
    return data;
  }
}
