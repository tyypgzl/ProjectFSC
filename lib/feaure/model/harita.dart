class Harita {
  int? id;
  String? isim;
  String? photo;
  String? aciklama;
  String? minimap;

  Harita({this.id, this.isim, this.photo, this.aciklama, this.minimap});

  Harita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    photo = json['photo'];
    aciklama = json['aciklama'];
    minimap = json['minimap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isim'] = isim;
    data['photo'] = photo;
    data['aciklama'] = aciklama;
    data['minimap'] = minimap;
    return data;
  }
}
