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
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
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
}

