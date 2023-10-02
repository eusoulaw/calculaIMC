class Pessoa {
  String _nome = "";
  double? _peso ;
  double? _altura ;

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double? getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double? getAltura() {
    return _altura;
  }

  Pessoa(String nome, double? peso, double? altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }
}