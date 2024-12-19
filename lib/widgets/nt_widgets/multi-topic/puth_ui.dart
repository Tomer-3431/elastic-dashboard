import 'package:flutter/material.dart';

import 'package:elastic_dashboard/services/nt4_client.dart';
import 'package:elastic_dashboard/widgets/nt_widgets/nt_widget.dart';

class Puth_UIModel extends MultiTopicNTWidgetModel {
  @override
  String type = Puth_UIWidget.widgetType;

  String get valueTopicName => '$topic/Value';

  late NT4Subscription valueSubscription;

  @override
  Puth_UIModel({
    required super.ntConnection,
    required super.preferences,
    required super.topic,
    super.dataType,
    super.period,
  }) : super();

  Puth_UIModel.fromJson({
    required super.ntConnection,
    required super.preferences,
    required super.jsonData,
  }) : super.fromJson();

  @override
  void initializeSubscriptions() {
    valueSubscription = ntConnection.subscribe(valueTopicName, super.period);
  }
}

class Puth_UIWidget extends NTWidget {
  static const String widgetType = 'puth_ui';

  const Puth_UIWidget({super.key}) : super();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
          Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 60,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'X',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const SizedBox(
              width: 60,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Y',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const SizedBox(
              width: 60,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Angle',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: Image.asset(
              "assets/fields/2024-field.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ),
    Text(Point(0,4,56).getPointString(), style: const TextStyle(fontSize: 24)),
    ],);
  }
}

class Point{
  late double x; // in miters
  late double y; // in meters
  late double angle; // in degrew

  Point(this.x, this.y, this.angle);
  String getPointString(){
    return ("x:${x} y:${y}a:$angle");
  }
}