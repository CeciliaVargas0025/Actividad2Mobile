import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/modelo_visao_nativa.dart';
import '../../../core/widgets/botao_personalizado.dart';

class VisaoNativa extends StatelessWidget {
  const VisaoNativa({super.key});

  @override
  Widget build(BuildContext context) {
    final modeloVisao = Provider.of<ModeloVisaoNativa>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo  Nativa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BotaoPersonalizado(
              texto: 'Mostrar Toast',
              aoPressionar: modeloVisao.carregando
                  ? null
                  : () => modeloVisao.mostrarToastNativo(),
              cor: Colors.green,
            ),
            const SizedBox(height: 20),
            BotaoPersonalizado(
              texto: 'Mostrar AlertDialog',
              aoPressionar: modeloVisao.carregando
                  ? null
                  : () => modeloVisao.mostrarDialogoNativo(),
              cor: Colors.orange,
            ),
            const SizedBox(height: 30),
            if (modeloVisao.carregando)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Comunicando com código nativo...'),
                ],
              ),
            if (modeloVisao.status.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  modeloVisao.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}