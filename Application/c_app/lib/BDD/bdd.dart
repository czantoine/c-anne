import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:c_app/BDD/Client_particulier.dart';
import 'package:c_app/BDD/Client_medecin.dart';


class DBProvider {

  DBProvider._();

  static DBProvider db = DBProvider._();
  static const databaseName = 'c-AnneDB.db';
  //static final DBProvider instance = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "c-AnneDB.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "c-AnneDB.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
// open the database
    var db = await openDatabase(path);
  }

  /* ------ CLIENT PARTICULIER ------ */

  //AJOUTER DANS BDD
  newClient_part(Client_particulier newClient) async {
    final db = await database;
    print("ui");
    print(db);
    var res = await db.rawInsert(
        "INSERT Into client_part (id,log, mdp, nom, prenom,num_securite_sociale,"
            "nom_medecin, num_medecin, nom_urgence1, num_urgence1,nom_urgence2, num_urgence2 )"
            " VALUES (?,${newClient.mail},${newClient
            .mdp} ,${newClient.nom} ,${newClient.prenom},${newClient
            .num_securite_sociale} "
            ",${newClient.nom_medecin} ,${newClient.num_medecin},${newClient
            .nom_urgence1}"
            ",${newClient.num_urgence1},${newClient.nom_urgence2},${newClient
            .num_urgence2})");
    return res;
  }

  /* ------ CLIENT MEDICAL ------ */

  //AJOUTER DANS BDD
  newClient_med(Client_med newClient) async {
    final db = await database;
    var res = await db.rawInsert(
        "INSERT Into client_med (id,log, mdp, nom, prenom,num_rpps)"
            " VALUES (${newClient.id},${newClient.log},${newClient.mdp} ,${newClient.nom} ,${newClient.prenom},${newClient.num_rpps}");
    return res;
  }
}
