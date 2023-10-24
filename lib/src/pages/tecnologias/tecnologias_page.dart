import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/pages/tecnologias/card_list.dart';
import 'package:portfolio_higor/src/pages/tecnologias/card_tecnologia.dart';

class TecnologiasPage extends StatelessWidget {
  const TecnologiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18, top: 20),
      height: MediaQuery.of(context).size.height + 40,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Color(0xFF413A69),
          ),
      child: const Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Habilidades',
              style: TextStyle(
                  fontSize: 48,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            flex: 4,
            child: CardGrid(cards: [
              CardWidget(nome: "Flutter", enderecoImagem: "flutterio-icon.svg"),
              CardWidget(nome: "Python", enderecoImagem: "python-original.svg"),
              CardWidget(nome: "C++", enderecoImagem: "cplusplus.svg"),
              CardWidget(nome: "QT", enderecoImagem: "qt.svg"),
              CardWidget(nome: "Dart", enderecoImagem: "dartlang-icon.svg"),
              CardWidget(nome: "Postgresql", enderecoImagem: "postgresql.svg"),
              CardWidget(
                  nome: "React Native", enderecoImagem: "react-native.svg"),
              CardWidget(nome: "TensorFlow", enderecoImagem: "tensorflow.svg"),
              CardWidget(
                  nome: "Scikit-Learn",
                  enderecoImagem: "Scikit_learn_logo_small.svg"),
              CardWidget(nome: "Linux", enderecoImagem: "linux-original.svg"),
              CardWidget(nome: "Git", enderecoImagem: "git-scm-icon.svg"),
              CardWidget(nome: "PHP", enderecoImagem: "php-original.svg"),
              CardWidget(nome: "Figma", enderecoImagem: "figma-icon.svg"),
            ]),
          ),
        ],
      ),
    );
  }
}
