// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilder databaseBuilder(String name) =>
      $AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      $AppDatabaseBuilder(null);
}

class $AppDatabaseBuilder {
  $AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  $AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UserEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _userEntityDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['id'],
            (UserEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  final DeletionAdapter<UserEntity> _userEntityDeletionAdapter;

  @override
  Future<List<UserEntity>> getUsers() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) =>
            UserEntity(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<void> insertUser(UserEntity user) async {
    await _userEntityInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertUsers(List<UserEntity> user) async {
    await _userEntityInsertionAdapter.insertList(
        user, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(UserEntity user) async {
    await _userEntityDeletionAdapter.delete(user);
  }
}
