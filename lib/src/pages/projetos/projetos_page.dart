import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/pages/projetos/listar_projetos.dart';

class ProjetosPage extends StatelessWidget {
  const ProjetosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 20),
      height: MediaQuery.of(context).size.height + 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Color(0xFF413A69),
          ),
      child: const Column(
        children: [
          Expanded(
            child: Text(
              "Projetos",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListarProjetos(),
          ),
        ],
      ),
    );
  }
}
