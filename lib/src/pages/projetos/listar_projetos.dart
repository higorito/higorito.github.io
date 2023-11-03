import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      "link": "https://github.com/higorito",
      "descricao":
          "Usei o flutter para criar um app que facilita a vida de quem está começando na eletrônica. O app reconhece componentes eletrônicos e fala o nome dele."
    },
    {
      "name": "Tflitev2",
      "image": "assets/images/tflitev2.png",
      "link": "https://github.com/higorito",
      "descricao": "aaaa",
    },
    {
      "name": "Gerador de Cachorros",
      "image": "assets/images/gerar_dog.png",
      "link": "https://github.com/higorito",
      "descricao": "aaaa",
    },
    {
      "name": "jogo",
      "image": "assets/images/printJoguin.png",
      "link": "https://github.com/higorito",
      "descricao": "aaaa",
    },
    {
      "name": "Notas",
      "image": "assets/images/notas.png",
      "link": "https://github.com/higorito",
      "descricao": "aaaa",
    },
  ];

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: altura,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.42,
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

  CardItem({required this.item});

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
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
              flex: 5,
              child: Image.asset(
                item['image']!,
                // height: altura * 0.4,
                // width: MediaQuery.of(context).size.width * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      item['name']!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['descricao']!,
                      style: TextStyle(
                        fontSize: (altura < 600) ? 10.0 : 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
