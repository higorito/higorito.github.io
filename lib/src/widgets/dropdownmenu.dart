import 'package:flutter/material.dart';

class DropdownMenuCustom extends StatefulWidget {
  final Function(int) onSelecionado;

  DropdownMenuCustom({required this.onSelecionado});

  @override
  _DropdownMenuCustomState createState() => _DropdownMenuCustomState();
}

class _DropdownMenuCustomState extends State<DropdownMenuCustom> {
  int _valorSelecionado = 1; // Valor inicial selecionado

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      dropdownColor: Colors.indigo,
      iconEnabledColor: Colors.greenAccent,
      value: _valorSelecionado,
      onChanged: (valor) {
        setState(() {
          _valorSelecionado = valor!;
        });
        widget.onSelecionado(valor!);
      },
      items: [
        DropdownMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              const Icon(Icons.home),
              Text(
                'Home',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              const Icon(Icons.person),
              Text(
                'Sobre',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 3,
          child: Row(
            children: [
              const Icon(Icons.work),
              Text(
                'Projetos',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 4,
          child: Row(
            children: [
              const Icon(Icons.mail),
              Text(
                'Contato',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
