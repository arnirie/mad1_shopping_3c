import 'package:mad1_shopping_3c/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //constants
  static const dbName = 'shopping.db';
  static const dbVersion = 3;
  //table constants
  static const tbName = 'products';
  static const colId = 'id';
  static const colTitle = 'title';
  static const colDescription = 'description';
  static const colPrice = 'price';
  static const colImageUrl = 'imageUrl';
  static const colIsFavorite = 'isFavorite';

  //methods for our db
  //TODO:
  //1) OPEN
  //2) CREATE TABLE WHEN DB IS CREATED
  //3) INSERT RECORD
  //4) UPDATE AND DELETE RECORDS
  //5) FETCH (READ)

  static Future<Database> openDB() async {
    var path = join(await getDatabasesPath(), DbHelper.dbName);
    var sql =
        'CREATE TABLE IF NOT EXISTS $tbName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPrice DECIMAL(10,4), $colImageUrl TEXT, $colIsFavorite INT)';
    // print(sql);
    var db = await openDatabase(
      path,
      version: DbHelper.dbVersion,
      onCreate: (db, version) {
        db.execute(sql);
        print('table $tbName created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (newVersion <= oldVersion) return;
        db.execute('DROP TABLE IF EXISTS $tbName');
        db.execute(sql);
        print('dropped and recreated');
      },
    );
    return db;
  }

  static void insertRaw() async {
    //open db
    final db = await openDB();
    var id = await db.rawInsert(
        "INSERT INTO products VALUES(NULL, 'pouch bag', 'expensive bag', 5000, NULL, 0)");
    print("inserted id: $id");
  }

  static void insertProduct(Product p) async {
    final db = await openDB();
    var id = await db.insert(
      tbName,
      p.toMapWithoutId(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('inserted id: $id');
  }

  static Future<List<Map<String, dynamic>>> fetchRaw() async {
    final db = await openDB();
    return await db.rawQuery('SELECT * FROM $tbName');
  }

  static Future<List<Map<String, dynamic>>> fetchQuery() async {
    final db = await openDB();
    return await db.query(tbName);
  }

  static void deleteRaw(int id) async {
    final db = await openDB();
    var num = await db.rawDelete('DELETE FROM $tbName WHERE $colId = $id');
    print('deleted $num rows');
  }
}
