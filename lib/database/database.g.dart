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

  ItemDAO? _itemDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `NewModel` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ItemDAO get itemDAO {
    return _itemDAOInstance ??= _$ItemDAO(database, changeListener);
  }
}

class _$ItemDAO extends ItemDAO {
  _$ItemDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _newModelInsertionAdapter = InsertionAdapter(
            database,
            'NewModel',
            (NewModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _newModelUpdateAdapter = UpdateAdapter(
            database,
            'NewModel',
            ['id'],
            (NewModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _newModelDeletionAdapter = DeletionAdapter(
            database,
            'NewModel',
            ['id'],
            (NewModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NewModel> _newModelInsertionAdapter;

  final UpdateAdapter<NewModel> _newModelUpdateAdapter;

  final DeletionAdapter<NewModel> _newModelDeletionAdapter;

  @override
  Future<List<NewModel>> findallItems() async {
    return _queryAdapter.queryList('SELECT * FROM NewModel',
        mapper: (Map<String, Object?> row) =>
            NewModel(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Stream<List<NewModel>> watchall() {
    return _queryAdapter.queryListStream('SELECT * FROM NewModel',
        mapper: (Map<String, Object?> row) =>
            NewModel(id: row['id'] as int?, name: row['name'] as String?),
        queryableName: 'NewModel',
        isView: false);
  }

  @override
  Future<void> insertitem(NewModel newModel) async {
    await _newModelInsertionAdapter.insert(newModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateitem(NewModel newModel) async {
    await _newModelUpdateAdapter.update(newModel, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteitem(NewModel newModel) {
    return _newModelDeletionAdapter.deleteAndReturnChangedRows(newModel);
  }
}
