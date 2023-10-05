import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  final ValueChanged<int> onSelecionado;

  Menu({super.key, required this.onSelecionado});

  final Uri _urlGit = Uri.parse('https://github.com/higorito');
  final Uri _urlLin = Uri.parse('linkedin.com/in/higor-pereira-comp/');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF413A69),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 6, 22, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'child:',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                    const TextSpan(
                      text: ' Text("',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    TextSpan(
                      text: 'Higor Pereira',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    const TextSpan(
                      text: '")',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => onSelecionado(1),
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.grey[300], fontSize: 18),
                    )),
                TextButton(
                    onPressed: () => onSelecionado(2),
                    child: Text(
                      'Sobre',
                      style: TextStyle(color: Colors.grey[300], fontSize: 18),
                    )),
                TextButton(
                    onPressed: () => onSelecionado(3),
                    child: Text(
                      'Projetos',
                      style: TextStyle(color: Colors.grey[300], fontSize: 18),
                    )),
                TextButton(
                    onPressed: () => onSelecionado(4),
                    child: Text(
                      'Contato',
                      style: TextStyle(color: Colors.grey[300], fontSize: 18),
                    )),
                IconButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print("mudar tema dps");
                    },
                    icon: const Icon(Icons.sunny)),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _launchUrl(_urlGit);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.grey[300],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _launchUrl(_urlLin);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.grey[300],
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
