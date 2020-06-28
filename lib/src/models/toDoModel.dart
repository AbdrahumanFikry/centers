import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  String title;
  DateTime date;
  String material;

  ToDoModel({
    this.title,
    this.date,
    this.material,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['material'] = this.material;
    return data;
  }
}
