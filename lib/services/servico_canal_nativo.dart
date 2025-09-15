import 'package:flutter/services.dart';

class ServicoCanalNativo {
  static const MethodChannel _canal = MethodChannel('canal_ui_nativa');

  static Future<void> mostrarToastNativo() async {
    try {
      await _canal.invokeMethod('mostrarToast');
    } on PlatformException catch (e) {
      throw Exception('Falha ao mostrar toast: ${e.message}');
    }
  }

  static Future<void> mostrarDialogoNativo() async {
    try {
      await _canal.invokeMethod('mostrarDialogo');
    } on PlatformException catch (e) {
      throw Exception('Falha ao mostrar diálogo: ${e.message}');
    }
  }
}