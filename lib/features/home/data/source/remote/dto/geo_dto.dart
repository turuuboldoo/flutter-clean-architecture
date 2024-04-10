import 'dart:convert';

GeoDto geoFromJson(String str) => GeoDto.fromJson(json.decode(str));

String geoToJson(GeoDto data) => json.encode(data.toJson());

class GeoDto {
  GeoDto({
    this.lat,
    this.lng,
  });

  GeoDto.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  String? lat;
  String? lng;

  GeoDto copyWith({
    String? lat,
    String? lng,
  }) =>
      GeoDto(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
