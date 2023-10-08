import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePage extends StatelessWidget {
  SobrePage({super.key});

  final Uri _urlGit = Uri.parse('https://github.com/higorito');
  final Uri _urlLin = Uri.parse('linkedin.com/in/higor-pereira-comp/');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF413A69),
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
          color: const Color(0xFF484175),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Image.asset(
                        'assets/images/eu.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              minimumSize: const Size(150, 60),
                              maximumSize: const Size(250, 80),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Acessar Tecnologias',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.arrowRight,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Flexible(
                          flex: 1,
                          child: Text(
                            "Entre em contato comigo!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 49, 42, 85),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    _launchUrl(_urlGit);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 49, 42, 85),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    _launchUrl(_urlLin);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 49, 42, 85),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    _sendEmail();
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sobre",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Comecei a programar em 2017, no técnico em Mecatrônica, onde aprendi a programar em C. Em 2020, comecei a faculdade de Engenharia de Computação onde aprendi a programar em C++, Java, Python, entre outras linguagens. A faculdade me proporcionou um conhecimento mais aprofundado em lógica, programação, paradigmas, projetos, e me fez gostar ainda mais da área. \n\nAtualmente estou estudando Flutter, para desenvolvimento de aplicativos mobile. Pretendo me especializar em desenvolvimento mobile, e futuramente integrar o incrível framework Flutter com a área de IoT e visão computacional. \n\nMeu foco é aprender e aprimorar minhas habilidades, como usar o Flutter para desenvolver aplicativos para a web como este portfólio feito 100% em Flutter.",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 16,
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
