import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:portfolio_higor/src/widgets/nome_mexendo.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class ConteudoHome extends StatelessWidget {
  const ConteudoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Olá, o meu nome é",
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 18,
            ),
          ),
          const Text(
            "Higor Pereira",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
          const NomeMexendo(),
          const SizedBox(
            height: 12,
          ),
          (tamanho.width > 600)
              ? const Text(
                  "Eu sou um desenvolvedor mobile, com foco em Flutter, estou sempre em busca de novos conhecimentos e desafios. Aprendo rápido e me arrisco em novas tecnologias. Venha conhecer um pouco mais sobre mim!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    overflow: TextOverflow.clip,
                  ),
                )
              : const Text(
                  "Eu sou um desenvolvedor mobile, com foco em Flutter, estou sempre em busca de novos conhecimentos e desafios. Aprendo rápido e me arrisco em novas tecnologias. Venha conhecer um pouco mais sobre mim!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    overflow: TextOverflow.visible,
                  ),
                ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await downloadPDF();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 22, 61, 23), // Cor da borda
                        width: 2, // Largura da borda
                      ),
                    ),
                    minimumSize: const Size(150, 70),
                  ),
                  child: const Text(
                    "Resumo",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    abrirGmail();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(150, 70),
                  ),
                  child: const Text(
                    "Contato",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          (tamanho.width > 600)
              ? Expanded(
                  flex: 1,
                  child: Center(
                    child: LottieBuilder.asset(
                      'assets/lottie/telapc.json',
                      // height: MediaQuery.of(context).size.height * 0.45,
                      // width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
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

  Future<void> downloadPDF() async {
    const fileName =
        '/cv/cvHigorPereira.pdf'; // Nome do arquivo PDF na pasta "assets"

    // Obter o caminho da pasta de documentos do dispositivo
    final documentsDirectory = await getApplicationDocumentsDirectory();

    // Construir o caminho de destino do arquivo PDF na pasta de documentos
    final filePath = '${documentsDirectory.path}/$fileName';

    // Verificar se o arquivo já existe na pasta de documentos
    final file = File(filePath);
    if (await file.exists()) {
      print('O arquivo PDF já existe em $filePath');
    } else {
      final data = await rootBundle.load('assets/$fileName');
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      print('O arquivo PDF foi copiado para $filePath');
    }
  }
}
