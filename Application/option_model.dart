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
    icon: Icon(Icons.do_not_disturb, size: 40.0),
    title: 'Option 2',
    subtitle: 'Blabla',
  ),
  Option(
    icon: Icon(Icons.account_circle, size: 40.0),
    title: 'Option 3',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.invert_colors, size: 40.0),
    title: 'Option 4',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.watch_later, size: 40.0),
    title: 'Option 5',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.fastfood, size: 40.0),
    title: 'Option 6',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.local_airport, size: 40.0),
    title: 'Option 7',
    subtitle: 'blabla',
  ),
  Option(
    icon: Icon(Icons.settings, size: 40.0),
    title: 'Option 8',
    subtitle: 'blabla',
  ),
];