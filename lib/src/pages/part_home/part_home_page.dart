import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_higor/src/pages/part_home/conteudo_home.dart';
import 'package:portfolio_higor/src/widgets/nome_mexendo.dart';

class PartHomePage extends StatefulWidget {
  const PartHomePage({super.key});

  @override
  State<PartHomePage> createState() => _PartHomePageState();
}

class _PartHomePageState extends State<PartHomePage> {
  var verdeescuroseprecisar = "4F9C4E";
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    var altura = mediaQuery.size.height;

    if (tamanho.width > 600) {
      altura = altura + 100;
    } else {
      altura = altura * 1.45;
    }
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 6, top: 20),
      height: altura,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(250, 60),
          bottomRight: Radius.elliptical(250, 60),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            // Theme.of(context).colorScheme.primary,
            // Theme.of(context).colorScheme.secondary,
            Color(0xFF6E44BB),
            Color(0xFF413A69),
          ],
        ),
      ),
      child: (tamanho.width > 600)
          ? Row(
              children: [
                const Expanded(
                  child: ConteudoHome(),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: LottieBuilder.asset(
                    'assets/lottie/pcProgramando.json',
                    // height: MediaQuery.of(context).size.height * 0.6,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const Expanded(
                  flex: 4,
                  child: ConteudoHome(),
                ),
                LottieBuilder.asset(
                  'assets/lottie/pcProgramando.json',
                  // height: MediaQuery.of(context).size.height * 0.6,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
    );
  }
}
