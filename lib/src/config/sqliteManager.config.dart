// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class SQliteManager {
//   static final instance = SQliteManager();

//   Database? database;

//   init() async {
//     try {
//       database = await openDatabase(
//         join(await getDatabasesPath(), 'ecommerce_database.db'),
//         version: 1,
//         onCreate: (db, version) {},
//       );

//       database.execute('CREATE TABLE CartItem(idCartItem INTEGER PRIMARY KEY,quantity INTEGER,  )');
//     } catch (e) {
//       print(e);
//     }
//   }
// }
