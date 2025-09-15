import 'package:flutter/material.dart';

class BotaoPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback? aoPressionar; 
  final Color cor;

  const BotaoPersonalizado({
    super.key,
    required this.texto,
    required this.aoPressionar,
    this.cor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: aoPressionar, 
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}