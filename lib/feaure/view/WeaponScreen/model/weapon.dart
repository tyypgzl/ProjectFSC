class WeaponModel {
  int? id;
  String? isim;
  String? photo;
  String? aciklama;
  String? tur;

  WeaponModel({this.id, this.isim, this.photo, this.aciklama, this.tur});

  WeaponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    photo = json['photo'];
    aciklama = json['aciklama'];
    tur = json['tur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isim'] = isim;
    data['photo'] = photo;
    data['aciklama'] = aciklama;
    data['tur'] = tur;
    return data;
  }
}
