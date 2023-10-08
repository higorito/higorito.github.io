import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/pages/part_home/part_home_page.dart';
import 'package:portfolio_higor/src/pages/sobre/sobre_page.dart';
import 'package:portfolio_higor/src/pages/tecnologias/tecnologias_page.dart';
import 'package:portfolio_higor/src/widgets/menu.dart';
import 'package:portfolio_higor/src/widgets/secao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  //meio zoado essas global key mas é necessario para a ancora
  final keySecao1 = GlobalKey();
  final keySecao2 = GlobalKey();
  final keySecao3 = GlobalKey();
  final keySecao4 = GlobalKey();

  @override
  void dispose() {
    scrollController
        .dispose(); // dispose do scrollController para evitar memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color(0xFF413A69),
          child: Column(
            children: [
              Menu(
                onSelecionado: _onSelecionado,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController, // controller do scroll
                  child: Column(
                    children: [
                      // Secao(key: keySecao1, cor: Colors.blue, altura: 1000),
                      PartHomePage(
                        key: keySecao1,
                      ),
                      SobrePage(
                        key: keySecao2,
                      ),
                      const TecnologiasPage(),
                      Secao(key: keySecao3, cor: Colors.green, altura: 1000),
                      Secao(key: keySecao4, cor: Colors.yellow, altura: 1000),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: const Icon(Icons.arrow_upward),
        ));
  }

  void _onSelecionado(int value) {
    final RenderBox renderBox; //para ve quando foi renderizado

    switch (value) {
      case 1:
        renderBox = keySecao1.currentContext!.findRenderObject() as RenderBox;
        break;
      case 2:
        renderBox = keySecao2.currentContext!.findRenderObject() as RenderBox;
        break;
      case 3:
        renderBox = keySecao3.currentContext!.findRenderObject() as RenderBox;
        break;
      case 4:
        renderBox = keySecao4.currentContext!.findRenderObject() as RenderBox;
        break;
      default:
        throw Exception(
          'error_message',
        );
    }
    final local = renderBox.localToGlobal(Offset.zero); //posição do objeto
    //no caso o offset é 0 pq queremos a posição do objeto em relação ao scroll
    scrollController.animateTo(
      local.dy + scrollController.offset, //o scroll é para n bugar a tela
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
