import 'package:flutter/material.dart';

class Secao extends StatelessWidget {
  final Color cor;
  final double altura;

  const Secao({
    Key? key,
    required this.cor,
    required this.altura,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: cor,
      height: altura,
      child: Text(cor.toString()),
    );
  }
}
