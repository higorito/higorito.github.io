import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class NomeMexendo extends StatelessWidget {
  const NomeMexendo({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Row(
      children: [
        (tamanho.width > 600)
            ? const Text(
                'Desenvolvedor ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              )
            : const Text(
                'Desenvolvedor ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.clip,
              ),
        (tamanho.width > 600)
            ? AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "Mobile",
                    textStyle: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
                repeatForever: true,
              )
            : AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "Mobile",
                    textStyle: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
                repeatForever: true,
              ),
      ],
    );
  }
}
