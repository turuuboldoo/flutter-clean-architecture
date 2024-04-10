import 'dart:convert';

import 'package:app/features/home/domain/model/user.dart';

import 'address_dto.dart';
import 'company_dto.dart';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));
String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = json['address'] != null ? AddressDto.fromJson(json['address']) : null;
    company = json['company'] != null ? CompanyDto.fromJson(json['company']) : null;
  }

  int? id;
  String? name;
  String? username;
  String? email;
  AddressDto? address;
  String? phone;
  String? website;
  CompanyDto? company;

  UserDto copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    AddressDto? address,
    String? phone,
    String? website,
    CompanyDto? company,
  }) =>
      UserDto(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        company: company ?? this.company,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['website'] = website;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

  User toUser() {
    return User(id: id, name: name);
  }
}
