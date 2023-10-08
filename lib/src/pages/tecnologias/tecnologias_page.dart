import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/pages/tecnologias/card_list.dart';
import 'package:portfolio_higor/src/pages/tecnologias/card_tecnologia.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TecnologiasPage extends StatelessWidget {
  const TecnologiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF413A69),
      ),
      child: const Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Habilidades',
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: CardGrid(cards: [
              CardWidget(nome: "Flutter", enderecoImagem: "flutterio-icon.svg"),
              CardWidget(nome: "Dart", enderecoImagem: "dartlang-icon.svg"),
              CardWidget(nome: "Python", enderecoImagem: "python-original.svg"),
              CardWidget(nome: "C++", enderecoImagem: "cplusplus.svg"),
              CardWidget(nome: "QT", enderecoImagem: "qt.svg"),
            ]),
          ),
          Expanded(child: Spacer()),
        ],
      ),
    );
  }
}
