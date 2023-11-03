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
      dropdownColor: Theme.of(context).colorScheme.background,
      iconEnabledColor: Colors.greenAccent,
      style: TextStyle(
        color: Colors.grey[300],
        fontSize: 18,
      ),
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
              const Icon(Icons.home, color: Colors.greenAccent),
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
              const Icon(Icons.person, color: Colors.greenAccent),
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
              const Icon(Icons.work, color: Colors.greenAccent),
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
              const Icon(Icons.mail, color: Colors.greenAccent),
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
