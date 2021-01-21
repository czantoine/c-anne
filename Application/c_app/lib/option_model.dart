import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.dashboard, size: 40.0),
    title: 'Option 1',
    subtitle: 'Blabla',
  ),
  Option(
    icon: Icon(Icons.notifications, size: 40.0),
    title: 'Notifications',
    subtitle: 'Blabla',
  ),
  Option(
    icon: Icon(Icons.help_outline, size: 40.0),
    title: 'Aide et Commentaires',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.info_outline, size: 40.0),
    title: 'À propos',
    subtitle: 'blabla',
  ),
];