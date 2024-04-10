import 'dart:convert';

import 'geo_dto.dart';

AddressDto addressFromJson(String str) => AddressDto.fromJson(json.decode(str));
String addressToJson(AddressDto data) => json.encode(data.toJson());

class AddressDto {
  AddressDto({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  AddressDto.fromJson(dynamic json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? GeoDto.fromJson(json['geo']) : null;
  }

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoDto? geo;

  AddressDto copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    GeoDto? geo,
  }) =>
      AddressDto(
        street: street ?? this.street,
        suite: suite ?? this.suite,
        city: city ?? this.city,
        zipcode: zipcode ?? this.zipcode,
        geo: geo ?? this.geo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['suite'] = suite;
    map['city'] = city;
    map['zipcode'] = zipcode;
    if (geo != null) {
      map['geo'] = geo?.toJson();
    }
    return map;
  }
}
