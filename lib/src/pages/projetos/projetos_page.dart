import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/pages/projetos/listar_projetos.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjetosPage extends StatelessWidget {
  ProjetosPage({super.key});

  final Uri _urlGit = Uri.parse('https://github.com/higorito');
  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Color(0xFF413A69),
          ),
      child: Column(
        children: [
          const Expanded(
            child: Text(
              "Projetos",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Arraste para o lado para ver mais ou clique na imagem para ir até o repositório.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              // color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Expanded(
            flex: 10,
            child: ListarProjetos(),
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.greenAccent,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.transparent,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                      color: Colors.greenAccent,
                      style: BorderStyle.solid,
                      width: 2),
                ),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                const Size(200, 50),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(200, 50),
              ),
            ),
            onPressed: () {
              _launchUrl(_urlGit);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ver mais",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
