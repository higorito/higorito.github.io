import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final String nome;
  final String enderecoImagem;

  const CardWidget(
      {super.key, required this.nome, required this.enderecoImagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shadowColor: Colors.white.withOpacity(0.4),
        color: const Color(0xFF413A69),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$enderecoImagem",
              fit: BoxFit.fill,
              height: 50,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nome,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
