import 'package:app/features/home/domain/model/user.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "users", primaryKeys: ['id'])
class UserEntity extends User {
  UserEntity({int? id, String? name}) : super(id: id, name: name);
}
