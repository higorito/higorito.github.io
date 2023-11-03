import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListarProjetos extends StatelessWidget {
  const ListarProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselDemo();
  }
}

class CarouselDemo extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "name": "Eletrônica Fácil",
      "image": "assets/images/eletronica_facil.png",
      "link": "https://github.com/higorito/eletronica-facil",
      "descricao":
          "Usei o flutter para criar um app que facilita a vida de quem está começando na eletrônica. O app reconhece componentes eletrônicos e fala o nome dele."
    },
    {
      "name": "Tflitev2",
      "image": "assets/images/tflitev2.png",
      "link": "https://github.com/higorito/tflitev2",
      "descricao": "Utilizei o Tflite para criar um app que reconhece objetos.",
    },
    {
      "name": "Alcool ou Gasolina",
      "image": "assets/images/alcoolGasolina.png",
      "link": "https://github.com/higorito/alcoolgasolina",
      "descricao":
          "App simples para calcular se é melhor abastacer com alcool ou gasolina.",
    },
    {
      "name": "Gerador de Cachorros",
      "image": "assets/images/gerar_dog.png",
      "link": "https://github.com/higorito/cachorros-ge",
      "descricao":
          "Usando o cubit para atualizar a tela. E fazendo um servidor em Dart",
    },
    {
      "name": "Artigo usando RNA",
      "image": "assets/images/RNA.png",
      "link": "https://github.com/higorito/trab-topicos",
      "descricao":
          "Avaliação de uma Rede Neural Artificial como Estimador de Casos de Dengue em Bambuí-MG",
    },
    {
      "name": "Jogo de Plataforma",
      "image": "assets/images/printJoguin.png",
      "link": "https://github.com/higorito/godotJoguinhoTestes",
      "descricao": "Aprendendo um pouco de godot.",
    },
    {
      "name": "Notas",
      "image": "assets/images/notas.png",
      "link": "https://github.com/higorito/notas",
      "descricao":
          "CRUD com Flutter e Firebase. Anoto algumas coisas, bem funcional.",
    },
  ];

  CarouselController buttonCarouselController = CarouselController();

  CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;

    var largura = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: altura,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: (largura > 600) ? 0.42 : 0.8,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return CardItem(item: item);
          },
        );
      }).toList(),
    );
  }
}

class CardItem extends StatelessWidget {
  final Map<String, String> item;

  const CardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;
    return Container(
      // height: altura * 0.8,

      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: altura * 0.01,
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                child: Image.asset(
                  item['image']!,
                  // height: altura * 0.4,
                  // width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  _launchUrl(Uri.parse(item['link']!));
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              flex: 1,
              child: Text(
                item['name']!,
                style: TextStyle(
                  fontSize: (altura > 600) ? 20.0 : 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item['descricao']!,
                  style: TextStyle(
                    fontSize: (altura > 600) ? 16.0 : 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
