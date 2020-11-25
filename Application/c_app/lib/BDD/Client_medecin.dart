import 'package:flutter/material.dart';

class Client_med {
  final int id;
  final int mail;
  final String mdp;
  final String nom;
  final String prenom;
  final int num_rpps;

  Client_med(
      {this.id, this.mail, this.mdp, this.nom, this.prenom, this.num_rpps});


  factory Client_med.fromMap(Map<String, dynamic> json) => new Client_med(
    id: json["id"],
    mail: json["log"],
    mdp: json["mdp"],
    nom: json["nom"],
    prenom: json["prenom"],
    num_rpps: json["num_rpps"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "log": mail,
    "mdp": mdp,
    "nom": nom,
    "prenom": prenom,
    "num_rpps": num_rpps,
  };



}