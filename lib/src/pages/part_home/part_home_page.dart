import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PartHomePage extends StatefulWidget {
  const PartHomePage({super.key});

  @override
  State<PartHomePage> createState() => _PartHomePageState();
}

class _PartHomePageState extends State<PartHomePage> {
  var verdeescuroseprecisar = "4F9C4E";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(350, 90),
          bottomRight: Radius.elliptical(350, 90),
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
      child: Row(
        children: [
          Expanded(
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Desenvolvedor  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AnimatedTextKit(animatedTexts: [
                        WavyAnimatedText(
                          "Mobile",
                          textStyle: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ], repeatForever: true),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Eu sou um desenvolvedor mobile, com foco em Flutter, e estou sempre em busca de novos conhecimentos e desafios. Aprendo rápido e me arrisco em novas tecnologias.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Color.fromARGB(
                                  255, 22, 61, 23), // Cor da borda
                              width: 2, // Largura da borda
                            ),
                          ),
                          minimumSize: const Size(150, 70),
                        ),
                        child: const Text(
                          "Resumo",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LottieBuilder.asset(
                    'assets/lottie/telapc.json',
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.25,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LottieBuilder.asset(
                  'assets/lottie/pcProgramando.json',
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
