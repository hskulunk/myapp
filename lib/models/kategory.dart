import 'package:flutter/material.dart';

class Kategory {
  final String id;
  final String title;
  final Color color;

  const Kategory({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
