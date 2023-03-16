import 'package:flutter/material.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final String perguntaTexto;
  final List<Widget> widgets;
  const Questionario(this.perguntaTexto, this.widgets, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(perguntaTexto),
        ...widgets,
      ],
    );
  }
}
