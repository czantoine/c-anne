import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:c_app/BDD/Client_particulier.dart';
import 'package:c_app/BDD/Client_medecin.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "c-AnneDB.db");
    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Client_particulier ("
              "id INTEGER PRIMARY KEY,"
              "log TEXT,"
              "mdp TEXT,"
              "nom TEXT,"
              "prenom TEXT,"
              "num_securité_sociale INTEGER,"
              "nom_medecin TEXT,"
              "num_medecin INTEGER,"
              "num_urgence1 INTEGER,"
              "num_urgence2 INTEGER,"
              "num_urgence3 INTEGER,"
              ")");
        });
  }


  /* ------ CLIENT PARTICULIER ------ */

  //AJOUTER DANS BDD
  newClient_part(Client_particulier newClient) async {
    final db = await database;
    var res = await db.rawInsert(
        "INSERT Into Client_particulier (id,log, mdp, nom, prenom,num_securite_sociale,"
            "nom_medecin, num_medecin, nom_urgence1, num_urgence1,nom_urgence2, num_urgence2 )"
            " VALUES (${newClient.id},${newClient.mail},${newClient
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
        "INSERT Into Client_med (id,log, mdp, nom, prenom,num_rpps)"
            " VALUES (${newClient.id},${newClient.mail},${newClient.mdp} ,${newClient.nom} ,${newClient.prenom},${newClient.num_rpps}");
    return res;
  }
}
