import 'package:app/features/home/data/source/local/entity/user_entity.dart';

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }

  UserEntity toUserEntity() {
    return UserEntity(id: id, name: name);
  }
}
