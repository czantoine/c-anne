import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String path;

  Option({this.icon, this.title,this.path});
}

final options = [
  Option(
    icon: Icon(Icons.people, size: 40.0),
    title: 'Communauté',
  ),
  Option(
    icon: Icon(Icons.info, size: 40.0),
    title: 'information',
  ),
];