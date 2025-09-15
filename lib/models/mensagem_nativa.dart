class MensagemNativa {
  final String titulo;
  final String conteudo;
  final DateTime timestamp;

  MensagemNativa({
    required this.titulo,
    required this.conteudo,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    return 'MensagemNativa{titulo: $titulo, conteudo: $conteudo, timestamp: $timestamp}';
  }
}