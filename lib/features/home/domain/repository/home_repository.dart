import 'package:app/features/home/domain/model/user.dart';
import 'package:app/util/resource/data_state.dart';

abstract class HomeRepository {
  Future<DataState<List<User>>> getUsers();
  Future<DataState<List<User>>> getUsersFromLocal();
  Future<void> insertUsers(List<User> users);
}
