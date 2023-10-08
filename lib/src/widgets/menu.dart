import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_higor/src/widgets/dropdownmenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  final ValueChanged<int> onSelecionado;

  Menu({super.key, required this.onSelecionado});

  final Uri _urlGit = Uri.parse('https://github.com/higorito');
  final Uri _urlLin = Uri.parse('linkedin.com/in/higor-pereira-comp/');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Container(
      color: const Color(0xFF413A69),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 6, 22, 12),
        child: (tamanho.width > 600)
            ? Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'child:',
                          style: TextStyle(
                              color: Color.fromARGB(255, 175, 199, 187)),
                        ),
                        TextSpan(
                          text: ' Text("',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        TextSpan(
                          text: 'Higor Pereira',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: '")',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => onSelecionado(1),
                            child: const Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () => onSelecionado(2),
                            child: const Text(
                              'Sobre',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () => onSelecionado(3),
                            child: const Text(
                              'Projetos',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () => onSelecionado(4),
                            child: const Text(
                              'Contato',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        IconButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print("mudar tema dps");
                            },
                            icon: const Icon(Icons.sunny)),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlGit);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlLin);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownMenuCustom(onSelecionado: onSelecionado),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Higor Pereira",
                        textStyle: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.clip,
                        ),
                        speed: const Duration(milliseconds: 250),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlGit);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlLin);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
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
