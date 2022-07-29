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

  ProductDao? _productDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `product` (`id` INTEGER NOT NULL, `image` TEXT NOT NULL, `name` TEXT NOT NULL, `quantity` INTEGER NOT NULL, `price` REAL NOT NULL, `isWishList` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'product',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'isWishList': item.isWishList ? 1 : 0
                }),
        _productDeletionAdapter = DeletionAdapter(
            database,
            'product',
            ['id'],
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'isWishList': item.isWishList ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  final DeletionAdapter<Product> _productDeletionAdapter;

  @override
  Future<List<Product>> getAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM product',
        mapper: (Map<String, Object?> row) => Product(
            id: row['id'] as int,
            image: row['image'] as String,
            name: row['name'] as String,
            quantity: row['quantity'] as int,
            price: row['price'] as double,
            isWishList: (row['isWishList'] as int) != 0));
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productInsertionAdapter.insert(product, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteProduct(Product product) async {
    await _productDeletionAdapter.delete(product);
  }
}
