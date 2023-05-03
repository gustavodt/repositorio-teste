import 'package:flutter/material.dart';

class CaixaDeTexto extends StatefulWidget {
  final controlador;
  final texto;
  final senha;
  final msgValidacao;

  const CaixaDeTexto(
      {super.key,
      this.controlador,
      this.texto,
      this.senha = false,
      this.msgValidacao});

  @override
  State<CaixaDeTexto> createState() => _CaixaDeTextoState();
}

class _CaixaDeTextoState extends State<CaixaDeTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: widget.controlador,
          validator: (value) {
            if (value!.isEmpty) {
              return widget.msgValidacao;
            }
          },
          obscureText: widget.senha,
          decoration: InputDecoration(
              labelText: widget.texto,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        ));
  }
}
