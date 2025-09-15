import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/modelo_visao_nativa.dart';
import 'views/visao_nativa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Nativa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
        create: (_) => ModeloVisaoNativa(),
        child: const VisaoNativa(),
      ),
    );
  }
}