import 'package:flutter/material.dart';

class IconoGenero extends StatelessWidget {
  IconoGenero({required this.icono, required this.texto});
  final icono;
  final texto;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, size: 60),
        SizedBox(
          height: 10,
        ),
        Text(texto,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
      ],
    );
  }
}

class ContenedorBMI extends StatelessWidget {
  // constructor
  ContenedorBMI({required this.color, this.hijo, required this.funcion});
  final funcion;
  final hijo;
  final color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcion,
      child: Container(
        child: hijo,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  Botones({required this.color, this.child, this.icon});
  final child;
  final color;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      color: color,
    );
  }
}
