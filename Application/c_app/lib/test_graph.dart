/*
import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'package:hexcolor/hexcolor.dart';


class Screen3 extends StatefulWidget {
  @override _Screen3State createState() => _Screen3State();}
class _Screen3State extends State<Screen3> {

  List<charts.Series<PieData, String>> _pieData;

  @override void initState() {
    super.initState();
    _pieData = List<charts.Series<PieData, String>>();
  }

  generateData() {
    var piedata = [
      new PieData('Work', 35.8),
      new PieData('Eat', 8.3),
      new PieData('Commute', 10.8),
      new PieData('TV', 15.6),
      new PieData('Sleep', 19.2),
      new PieData('Other', 10.3),
    ];
    _pieData.add(
      charts.Series(
        domainFn: (PieData data, _) => data.activity,
        measureFn: (PieData data, _) => data.time,
        id: 'Time spent',
        data: piedata,
        labelAccessorFn: (PieData row, _) => '${row.activity}',
      ),
    );
    return _pieData;
  }
  @override Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: charts.PieChart(
              generateData(),
              animate: true,
              animationDuration: Duration(seconds: 1, milliseconds: 5),
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 100,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.inside)
                ],
              ),
            ),
          ),
        )
    );
  }
}
class PieData {
  String activity;
  double time;
  PieData(this.activity, this.time);
}
*/
