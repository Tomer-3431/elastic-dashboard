import 'package:flutter/material.dart';


import 'package:elastic_dashboard/services/nt4_client.dart';
import 'package:elastic_dashboard/widgets/nt_widgets/nt_widget.dart';
import 'package:elastic_dashboard/services/field_images.dart';

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
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Image from assets"),
          ),
          body: Image.asset("assets/fields/2024-field.png"), //   <--- image
        ),
      );
  }
}