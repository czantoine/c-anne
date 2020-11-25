import 'package:flutter/material.dart';

class Client_particulier {
  final int id;
  final int mail;
  final String mdp;
  final String nom;
  final String prenom;
  final int num_securite_sociale;
  final int num_medecin;
  final int num_urgence1;
  final int num_urgence2;
  final int num_urgence3;


  Client_particulier({this.id,this.mail, this.mdp, this.nom, this.prenom, this.num_securite_sociale,
    this.num_medecin, this.num_urgence1, this.num_urgence2, this.num_urgence3});
}