import 'dart:math';

class Calc {
  Calc({this.peso, this.estatura});

  final peso;
  final estatura;

  double _imc = 0;

  // Metodo BMI
  String calcularBMI() {
    _imc = peso / (pow(estatura / 100, 2));
    return _imc.toStringAsFixed(1);
  }

  String obtenerResultado() {
    if (_imc >= 25) {
      return "Sobrepeso";
    } else if (_imc < 18.5) {
      return "Normal";
    } else {
      return "Peso bajo";
    }
  }

  String interpretarBMI() {
    if (_imc >= 25) {
      return "Tu peso esta por arriba de lo normal";
    } else if (_imc < 18.5) {
      return "Mantén tu peso actual";
    } else {
      return "Tu peso esta muy por debajo de lo normal";
    }
  }
}
