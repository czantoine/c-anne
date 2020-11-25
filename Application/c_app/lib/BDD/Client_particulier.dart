import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Client_particulier {
  final int id;
  final int mail;
  final String mdp;
  final String nom;
  final String prenom;
  final int num_securite_sociale;
  final String nom_medecin;
  final int num_medecin;
  final String nom_urgence1;
  final int num_urgence1;
  final String nom_urgence2;
  final int num_urgence2;


  Client_particulier({this.id,this.mail, this.mdp, this.nom, this.prenom, this.num_securite_sociale,
    this.nom_medecin, this.num_medecin, this.nom_urgence1, this.num_urgence1, this.nom_urgence2, this.num_urgence2});

  factory Client_particulier.fromMap(Map<String, dynamic> json) => new Client_particulier(
    id: json["id"],
    mail: json["log"],
    mdp: json["mdp"],
    nom: json["nom"],
    prenom: json["prenom"],
    num_securite_sociale: json["num_securite_sociale"],
    nom_medecin: json["nom_medecin"],
    num_medecin: json["num_medecin"],
    nom_urgence1: json["nom_urgence1"],
    num_urgence1: json["num_urgence1"],
    nom_urgence2: json["nom_urgence2"],
    num_urgence2: json["num_urgence2"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "log": mail,
    "mdp": mdp,
    "nom": nom,
    "prenom": prenom,
    "num_securite_sociale": num_securite_sociale,
    "nom_medecin": nom_medecin,
    "num_medecin": num_medecin,
    "nom_urgence1": nom_urgence1,
    "num_urgence1": num_urgence1,
    "nom_urgence2": nom_urgence2,
    "num_urgence2": num_urgence2,
  };

}