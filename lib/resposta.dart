import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  const Resposta(this.texto, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(color: Colors.white));
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
