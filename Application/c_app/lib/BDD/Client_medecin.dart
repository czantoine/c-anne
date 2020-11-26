import 'package:flutter/material.dart';

class Client_med {
  final int id;
  final String log;
  final String mdp;
  final String nom;
  final String prenom;
  final int num_rpps;

  Client_med(
      {this.id, this.log, this.mdp, this.nom, this.prenom, this.num_rpps});


  factory Client_med.fromMap(Map<String, dynamic> json) => new Client_med(
    id: json["ID_client_med"],
    log: json["log"],
    mdp: json["mdp"],
    nom: json["nom"],
    prenom: json["prenom"],
    num_rpps: json["num_rpps"],
  );

  Map<String, dynamic> toMap() => {
    "ID_client_med": id,
    "log": log,
    "mdp": mdp,
    "nom": nom,
    "prenom": prenom,
    "num_rpps": num_rpps,
  };



}