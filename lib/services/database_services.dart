


import 'package:charikati/models/designation.dart';
import 'package:charikati/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  final String designationTable = 'designation';
  final String productsTable = 'products';
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();


   static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'flutter_sqflite_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {designation} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE $designationTable(id INTEGER PRIMARY KEY, name TEXT)',
    );
    await db.execute(
      'CREATE TABLE $productsTable(id INTEGER PRIMARY KEY, name TEXT, price INTEGER, designationId INTEGER, FOREIGN KEY (designationId) REFERENCES $designationTable(id) ON DELETE SET NULL)',
    );
    
  }

Future<void> insertDesignation(Designation designation) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    
    await db.insert(
      designationTable,
      designation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
Future<void> insertProduct(Product product) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    
    await db.insert(
      productsTable,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //A method that retrieves all the breeds from the breeds table.
  Future<List<Designation>> getDesignations() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query(designationTable);

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Designation.fromMap(maps[index]));
  }

Future<List<Product>> getProducts() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query(productsTable);

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Product.fromMap(maps[index]));
  }

   Future<Designation> designation(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(designationTable, where: 'id = ?', whereArgs: [id]);
    return Designation.fromMap(maps[0]);
  }
  
}
  
