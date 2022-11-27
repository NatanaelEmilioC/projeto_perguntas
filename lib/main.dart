import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 2},
        {'texto': 'vermelho', 'pontuacao': 4},
        {'texto': 'verde', 'pontuacao': 6},
        {'texto': 'branco', 'pontuacao': 8},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 2},
        {'texto': 'cobra', 'pontuacao': 4},
        {'texto': 'elefante', 'pontuacao': 6},
        {'texto': 'leão', 'pontuacao': 8},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 2},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Leo', 'pontuacao': 6},
        {'texto': 'Pedro', 'pontuacao': 8},
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder)
            // ignore: prefer_const_constructors
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuaestionario: _reiniciarQuestionario),
      ),
    );
  }
}
