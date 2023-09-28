import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700));
  }
}
