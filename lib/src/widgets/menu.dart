import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_higor/main.dart';

import 'package:portfolio_higor/src/widgets/dropdownmenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  final ValueChanged<int> onSelecionado;

  const Menu({super.key, required this.onSelecionado});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final Uri _urlGit = Uri.parse('https://github.com/higorito');

  final Uri _urlLin = Uri.parse('linkedin.com/in/higor-pereira-comp/');

  bool isDarkTheme = false; // Variável de estado para controlar o tema

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Container(
      // color: const Color(0xFF413A69),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 6, 22, 12),
        child: (tamanho.width > 600)
            ? Row(
                children: [
                  // RichText(
                  //   text: const TextSpan(
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: 'child:',
                  //         style: TextStyle(
                  //             color: Color.fromARGB(255, 175, 199, 187)),
                  //       ),
                  //       TextSpan(
                  //         text: ' Text("',
                  //         style: TextStyle(color: Colors.blueAccent),
                  //       ),
                  //       TextSpan(
                  //         text: 'Higor Pereira',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       TextSpan(
                  //         text: '")',
                  //         style: TextStyle(color: Colors.blueAccent),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "< Higor Pereira />",
                        textStyle: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.clip,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => widget.onSelecionado(1),
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.greenAccent,
                              ),
                            )),
                        TextButton(
                            onPressed: () => widget.onSelecionado(2),
                            child: const Text(
                              'Sobre',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.greenAccent,
                              ),
                            )),
                        TextButton(
                            onPressed: () => widget.onSelecionado(3),
                            child: const Text(
                              'Projetos',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.greenAccent,
                              ),
                            )),
                        TextButton(
                            onPressed: () => widget.onSelecionado(4),
                            child: const Text(
                              'Contato',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.greenAccent,
                              ),
                            )),
                        // IconButton(
                        //   onPressed: () {
                        //     // Alterar o tema aqui
                        //     if (Theme.of(context).brightness ==
                        //         Brightness.light) {
                        //       // Mudar para o tema escuro
                        //       ThemeManager.changeTheme(ThemeData.dark());
                        //     } else {
                        //       // Mudar para o tema claro
                        //       ThemeManager.changeTheme(ThemeData.light());
                        //     }
                        //   },
                        //   icon: Theme.of(context).brightness == Brightness.light
                        //       ? FaIcon(
                        //           FontAwesomeIcons.moon,
                        //           color: Colors.black,
                        //         )
                        //       : FaIcon(
                        //           FontAwesomeIcons.sun,
                        //           color:
                        //               Theme.of(context).colorScheme.secondary,
                        //         ),
                        // )
                        FlutterSwitch(
                          width: 80.0,
                          height: 35.0,
                          toggleSize: 45.0,
                          value: isDarkTheme,
                          borderRadius: 30.0,
                          padding: 8.0,
                          inactiveColor: Colors.grey[900]!,
                          activeColor: Colors.grey[400]!,
                          activeIcon: const Icon(
                            Icons.wb_sunny,
                            color: Colors.yellow,
                          ),
                          inactiveIcon: const Icon(
                            Icons.nightlight_round,
                            color: Colors.black,
                          ),
                          onToggle: (val) {
                            setState(() {
                              isDarkTheme = val;
                              if (isDarkTheme) {
                                ThemeManager.changeTheme(ThemeData.dark());
                              } else {
                                ThemeManager.changeTheme(ThemeData.light());
                              }
                              // print(isDarkTheme)
                            });
                          },
                        ),
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
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlLin);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownMenuCustom(onSelecionado: widget.onSelecionado),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Higor Pereira",
                        textStyle: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 22,
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
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl(_urlLin);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Theme.of(context).colorScheme.secondary,
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
