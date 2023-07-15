class ProvinceResponse {
  List<Province>? data;

  ProvinceResponse({this.data});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Province>[];
      json['data'].forEach((v) {
        data!.add(new Province.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Province {
  int? id;
  String? name;
  List<City>? cities;

  Province({this.id, this.name, this.cities});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? provinceId;

  City({this.id, this.name, this.provinceId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province_id'] = this.provinceId;
    return data;
  }
}
