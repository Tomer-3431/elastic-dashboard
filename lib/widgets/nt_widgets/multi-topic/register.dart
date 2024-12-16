import 'package:flutter/material.dart';


import 'package:elastic_dashboard/services/nt4_client.dart';
import 'package:elastic_dashboard/widgets/nt_widgets/nt_widget.dart';

class ReminderModel extends MultiTopicNTWidgetModel {
  @override
  String type = ReminderWidget.widgetType;

  String get valueTopicName => '$topic/Value';

  late NT4Subscription valueSubscription;

  @override


  ReminderModel({
    required super.ntConnection,
    required super.preferences,
    required super.topic,
    super.dataType,
    super.period,
  }) : super();

  ReminderModel.fromJson({
    required super.ntConnection,
    required super.preferences,
    required super.jsonData,
  }) : super.fromJson();

  @override
  void initializeSubscriptions() {
    valueSubscription = ntConnection.subscribe(valueTopicName, super.period);
  }

}

class ReminderWidget extends NTWidget {
  static const String widgetType = 'Reminder';

  const ReminderWidget({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'Hello', // default text style
        children: <TextSpan>[
          TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}