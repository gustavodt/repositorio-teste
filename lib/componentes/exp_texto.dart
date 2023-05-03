import 'package:flutter/material.dart';

class Exptexto extends StatefulWidget {
  String? texto;
  Color? color;
  double? size;

  Exptexto({super.key, this.texto, this.color, this.size});

  @override
  State<Exptexto> createState() => _ExptextoState();
}

class _ExptextoState extends State<Exptexto> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        widget.texto!,
        style: TextStyle(color: widget.color, fontSize: widget.size),
      ),
    );
  }
}
