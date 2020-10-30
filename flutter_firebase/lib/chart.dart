import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chart'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('list').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();
            return SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Programming Languages'),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<ProgrammingData, String>>[
                ColumnSeries<ProgrammingData, String>(
                    color: Colors.deepPurpleAccent,
                    dataSource: snapshot.data.docs
                        .map((chart) => ProgrammingData(
                              chart['name'],
                              chart['votes'],
                            ))
                        .toList(),
                    xValueMapper: (ProgrammingData data, _) => data.name,
                    yValueMapper: (ProgrammingData data, _) => data.votes,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
            );
          },
        ));
  }
}

class ProgrammingData {
  ProgrammingData(this.name, this.votes);

  final String name;
  final int votes;
}
