class Harita {
  int? id;
  String? isim;
  String? photo;
  String? aciklama;

  Harita({
    this.id,
    this.isim,
    this.photo,
    this.aciklama,
  });

  Harita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    photo = json['photo'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isim'] = isim;
    data['photo'] = photo;
    data['aciklama'] = aciklama;

    return data;
  }
}
