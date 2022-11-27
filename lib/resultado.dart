// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  final Function() quandoReiniciarQuaestionario;
  // ignore: use_key_in_widget_constructors
  const Resultado(
      {required this.pontuacao, required this.quandoReiniciarQuaestionario});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Imprecionante';
    } else {
      return 'Nível Jedi!!';
    }
  }

  @override
  // ignore: duplicate_ignore, duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 24)),
        ),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onPressed: quandoReiniciarQuaestionario,
            child: Text('Reiniciar?')),
      ],
    );
  }
}
