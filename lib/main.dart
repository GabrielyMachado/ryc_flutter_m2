import 'package:flutter/material.dart';
import './resposta.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionadada = 0;
  var _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionadada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionadada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionadada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
        {'texto': 'Branco', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 2},
        {'texto': 'Cobra', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 8},
        {'texto': 'João', 'pontuacao': 7},
        {'texto': 'Leo', 'pontuacao': 4},
        {'texto': 'Pedro', 'pontuacao': 9},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionadada].cast()['resposta']
        : [];
    List<Widget> widgets = respostas
        .map((resp) => Resposta(resp['texto'] as String,
            () => _responder(int.parse(resp['pontuacao'].toString()))))
        .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                _perguntas[_perguntaSelecionadada]['texto'].toString(), widgets)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
