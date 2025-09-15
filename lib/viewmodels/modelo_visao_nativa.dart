import 'package:flutter/material.dart';
import '../services/servico_canal_nativo.dart';

class ModeloVisaoNativa with ChangeNotifier {
  bool _carregando = false;
  String _status = '';

  bool get carregando => _carregando;
  String get status => _status;

  Future<void> mostrarToastNativo() async {
    _definirCarregando(true);
    _definirStatus('Mostrando Toast...');
    
    try {
      await ServicoCanalNativo.mostrarToastNativo();
      _definirStatus('Toast mostrado com sucesso');
    } catch (e) {
      _definirStatus('Erro: $e');
    } finally {
      _definirCarregando(false);
    }
  }

  Future<void> mostrarDialogoNativo() async {
    _definirCarregando(true);
    _definirStatus('Mostrando AlertDialog...');
    
    try {
      await ServicoCanalNativo.mostrarDialogoNativo();
      _definirStatus('AlertDialog mostrado com sucesso');
    } catch (e) {
      _definirStatus('Erro: $e');
    } finally {
      _definirCarregando(false);
    }
  }

  void _definirCarregando(bool carregando) {
    _carregando = carregando;
    notifyListeners();
  }

  void _definirStatus(String mensagem) {
    _status = mensagem;
    notifyListeners();
  }
}