import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_higor/src/pages/sobre/texto_ver_mais.dart';
import 'package:portfolio_higor/src/pages/tecnologias/tecnologias_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Color(0xFF413A69),
          ),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // color: const Color(0xFF484175),
          color: Theme.of(context).colorScheme.onSecondary,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    (tamanho.width > 600)
                        ? Expanded(
                            flex: 2,
                            child: Container(
                              child: Image.asset(
                                'assets/images/eu.jpg',
                              ),
                            ),
                          )
                        : Expanded(
                            flex: 1,
                            child: Container(
                              child: Image.asset(
                                'assets/images/eu.jpg',
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const TecnologiasPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            foregroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            minimumSize: const Size(80, 60),
                            maximumSize: const Size(250, 80),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Acessar Tecnologias',
                                style: (tamanho.width > 600)
                                    ? const TextStyle(
                                        // color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )
                                    : const TextStyle(
                                        // color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              (tamanho.width > 600)
                                  ? const FaIcon(
                                      FontAwesomeIcons.arrowRight,
                                      size: 20,
                                      // color: Colors.black,
                                    )
                                  : const FaIcon(
                                      FontAwesomeIcons.arrowRight,
                                      size: 12,
                                      // color: Colors.black,
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //aqui vai ter contatos dps
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (tamanho.width > 600)
                        ? const Text(
                            "Sobre",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                color: Colors.white),
                          )
                        : const Text(
                            "Sobre",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    (tamanho.width > 600)
                        ? Text(
                            "👋 Sou um estudante de Engenharia de Computação, apaixonado por tecnologia e inovação.\n\n💼 Estou em busca de uma oportunidade de estágio e estou disposto a atuar em qualquer área, pois aprendo rapidamente e me divirto durante o processo. \n\n👨‍💻 Atualmente, estou focado no estudo do Flutter para o desenvolvimento de aplicativos móveis, integrando-o com conhecimentos prévios em IoT e machine learning. \n\n📫 Este portfólio foi criado inteiramente em Flutter. Entre em contato comigo! ",
                            style: TextStyle(
                              // color: Colors.grey[300],
                              fontSize: 16,
                            ),
                          )
                        : const TextoVerMais(),
                  ],
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

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'higorps198@gmail.com',
      queryParameters: {
        'subject': 'Preencha o assunto(vaguinha?)',
        'body': 'Me contrate rsrs',
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Não foi possível abrir o cliente de e-mail.';
    }
  }
}
