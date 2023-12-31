// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
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

  BookDao? _bookDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `UserVO` (`id` INTEGER, `name` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookVO` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `subtitle` TEXT NOT NULL, `authors` TEXT NOT NULL, `image` TEXT NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userVOInsertionAdapter = InsertionAdapter(
            database,
            'UserVO',
            (UserVO item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password
                }),
        _userVODeletionAdapter = DeletionAdapter(
            database,
            'UserVO',
            ['id'],
            (UserVO item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserVO> _userVOInsertionAdapter;

  final DeletionAdapter<UserVO> _userVODeletionAdapter;

  @override
  Future<List<UserVO>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UserVO',
        mapper: (Map<String, Object?> row) => UserVO(row['id'] as int?,
            row['name'] as String, row['password'] as String));
  }

  @override
  Future<UserVO?> findUserByNameAndPassword(
      String name, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM UserVO WHERE name = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UserVO(row['id'] as int?,
            row['name'] as String, row['password'] as String),
        arguments: [name, password]);
  }

  @override
  Future<void> insertPerson(UserVO user) async {
    await _userVOInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePerson(UserVO user) async {
    await _userVODeletionAdapter.delete(user);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bookVOInsertionAdapter = InsertionAdapter(
            database,
            'BookVO',
            (BookVO item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subtitle': item.subtitle,
                  'authors': item.authors,
                  'image': item.image,
                  'url': item.url
                }),
        _bookVODeletionAdapter = DeletionAdapter(
            database,
            'BookVO',
            ['id'],
            (BookVO item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subtitle': item.subtitle,
                  'authors': item.authors,
                  'image': item.image,
                  'url': item.url
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookVO> _bookVOInsertionAdapter;

  final DeletionAdapter<BookVO> _bookVODeletionAdapter;

  @override
  Future<List<BookVO>> findAllFavouriteBook() async {
    return _queryAdapter.queryList('SELECT * FROM BookVO',
        mapper: (Map<String, Object?> row) => BookVO(
            id: row['id'] as String,
            title: row['title'] as String,
            subtitle: row['subtitle'] as String,
            authors: row['authors'] as String,
            image: row['image'] as String,
            url: row['url'] as String));
  }

  @override
  Future<void> insertFavBook(BookVO book) async {
    await _bookVOInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeFavBook(BookVO book) async {
    await _bookVODeletionAdapter.delete(book);
  }
}
