import 'dart:convert';

CompanyDto companyFromJson(String str) => CompanyDto.fromJson(json.decode(str));
String companyToJson(CompanyDto data) => json.encode(data.toJson());

class CompanyDto {
  CompanyDto({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  CompanyDto.fromJson(dynamic json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  String? name;
  String? catchPhrase;
  String? bs;

  CompanyDto copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) =>
      CompanyDto(
        name: name ?? this.name,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['catchPhrase'] = catchPhrase;
    map['bs'] = bs;
    return map;
  }
}
