import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecao;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Resposta(this.texto, this.quandoSelecao);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: quandoSelecao,
          child: Text(texto)),
    );
  }
}
