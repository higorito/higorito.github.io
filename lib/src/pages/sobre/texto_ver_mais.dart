import 'package:flutter/material.dart';

class TextoVerMais extends StatefulWidget {
  const TextoVerMais({super.key});

  @override
  State<TextoVerMais> createState() => _TextoVerMaisState();
}

class _TextoVerMaisState extends State<TextoVerMais> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF413A69),
          title: const Text('Sobre mim'),
          content: Text(
            "Comecei a programar em 2017, no técnico em Mecatrônica, onde aprendi a programar em C. Em 2020, comecei a faculdade de Engenharia de Computação onde aprendi a programar em C++, Java, Python, entre outras linguagens. A faculdade me proporcionou um conhecimento mais aprofundado em lógica, programação, paradigmas, projetos, e me fez gostar ainda mais da área. \n\nAtualmente estou estudando Flutter, para desenvolvimento de aplicativos mobile. Pretendo me especializar em desenvolvimento mobile, e futuramente integrar o incrível framework Flutter com a área de IoT e visão computacional. \n\nMeu foco é aprender e aprimorar minhas habilidades, como usar o Flutter para desenvolver aplicativos para a web como este portfólio feito 100% em Flutter.",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sou estudante de Engenharia de Computação, e desenvolvedor Flutter. Clique no botão abaixo para saber mais sobre mim.',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16,
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: const Text(""),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showAlertDialog(context);
              _toggleVisibility();
            },
            child: Text(_isVisible ? 'Ver Menos' : 'Ver Mais'),
          ),
        ],
      ),
    );
  }
}
