import 'package:flutter/material.dart';

class Client_medecin {
  final int id;
  final int mail;
  final String mdp;
  final String nom;
  final String prenom;
  final int num_rpps;

  Client_medecin(
      {this.id, this.mail, this.mdp, this.nom, this.prenom, this.num_rpps});
}