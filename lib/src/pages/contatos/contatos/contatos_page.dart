import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatosPage extends StatelessWidget {
  ContatosPage({super.key});

  final Uri _urlGit = Uri.parse('https://github.com/higorito');
  final Uri _urlLin =
      Uri.parse('https://www.linkedin.com/in/higor-pereira-comp/');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height - 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.onSecondaryContainer,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Entre em Contato",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            flex: 2,
            child: Text(
              "Entre em contato comigo através das redes sociais!",
              style: TextStyle(
                fontSize: 24,
                // color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: IconButton(
                  onPressed: () {
                    _launchUrl(_urlLin);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 60,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: IconButton(
                  onPressed: () {
                    _launchUrl(_urlGit);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.githubAlt,
                    size: 60,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: IconButton(
                  onPressed: () {
                    abrirGmail();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.envelope,
                    size: 60,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: Spacer(),
          ),
          Expanded(
            child: Text(
              "Foi um prazer ter você aqui!",
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
          const Expanded(
              child: Text(
            "Higor Pereira © 2023",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'higorps198@gmail.com',
      query: 'subject=Reportar&body=Vou te contratar rs ',
    );
    String url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
