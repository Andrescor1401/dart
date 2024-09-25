import 'dart:mirrors';
import 'Calculadora.dart';
import 'Calcular.dart';
class Gestionarcalculadora {
  late Calculadora calculadora;
  late Calcular cal;

  // Constructor de Gestionarcalculadora
  Gestionarcalculadora() {
    // Primero inicializamos calculadora
    calculadora = Calculadora();
    
    // Luego pasamos calculadora a Calcular
    cal = Calcular(calculadora);
  }

  Calculadora crearCalculo() {
    // Se asignan los valores calculados a la instancia de Calculadora
    double costo = cal.calcularCosto();
    calculadora.costo = costo;

    double gastos = cal.calcularGastos();
    calculadora.gastos = gastos;

    double riesgo = cal.calcularRiesgo();
    calculadora.riesgo = riesgo;

    double ganancia = cal.calcularGanancia();
    calculadora.ganancia = ganancia;

    double impuestos = cal.calcularImpuestos();
    calculadora.impuestos = impuestos;

    return calculadora;
  }

  // Método para mostrar los resultados
  void mostrarResultados() {
    double total = (calculadora.costo ?? 0) +
                   (calculadora.gastos ?? 0) +
                   (calculadora.riesgo ?? 0) +
                   (calculadora.ganancia ?? 0) +
                   (calculadora.impuestos ?? 0);
    print("El precio total de su proyecto es de: \$${total}");/*               
    print("Resultados del Cálculo:");
    print("Costo: \$${calculadora.costo}");
    print("Gastos: \$${calculadora.gastos}");
    print("Riesgo: \$${calculadora.riesgo}");
    print("Ganancia: \$${calculadora.ganancia}");
    print("Impuestos: \$${calculadora.impuestos}");*/
  }

  void mostrarResultadosReflexivo() {
  InstanceMirror im = reflect(calculadora);
  ClassMirror cm = im.type;

  print("Resultados del cálculo (usando reflexión):");

  // Iterar sobre los atributos de la clase Calculadora
  cm.declarations.forEach((Symbol symbol, DeclarationMirror declarationMirror) {
    if (declarationMirror is VariableMirror) {
      var fieldName = MirrorSystem.getName(symbol);  // Obtener el nombre del atributo
      var fieldValue = im.getField(symbol).reflectee;  // Obtener el valor del atributo
      print("$fieldName: \$${fieldValue ?? 0}");  // Mostrar nombre y valor
    }
  });

  // Calcular el total sumando los valores reflejados
  double total = (im.getField(#costo).reflectee ?? 0) +
                 (im.getField(#gastos).reflectee ?? 0) +
                 (im.getField(#riesgo).reflectee ?? 0) +
                 (im.getField(#ganancia).reflectee ?? 0) +
                 (im.getField(#impuestos).reflectee ?? 0);

  print("Total (usando reflexión): \$${total}");
}



}

