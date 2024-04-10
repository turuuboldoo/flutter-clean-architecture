import 'package:app/features/home/data/source/local/entity/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users')
  Future<List<UserEntity>> getUsers();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(UserEntity user);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUsers(List<UserEntity> user);

  @delete
  Future<void> deleteUser(UserEntity user);
}
