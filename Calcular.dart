import 'GestionarCostos.dart';
import 'Calculadora.dart';
import 'GestionarGastos.dart';
import 'GestionarImpuestos.dart';
import 'dart:mirrors';

class Calcular {
  GestionarCostos gc;
  Gestionargastos gg;
  late GestionarImpuestos gi;
  Calculadora cal;

  // Constructor que recibe la instancia de Calculadora
  Calcular(this.cal)
      : gc = GestionarCostos(),
        gg = Gestionargastos() {
    gi = GestionarImpuestos(this);
  }

  
  void iniciarCalculo() {
    gc.solicitarDatos();  
  }
  void invocarMetodosDinamicos() {
  InstanceMirror im = reflect(this);
  ClassMirror cm = im.type;

  print("Invocando métodos de cálculo de forma dinámica:");

  // Iterar sobre los métodos de la clase Calcular
  cm.declarations.forEach((Symbol symbol, DeclarationMirror declarationMirror) {
    if (declarationMirror is MethodMirror && declarationMirror.isRegularMethod) {
      String methodName = MirrorSystem.getName(symbol);

      
      if (methodName.startsWith("calcular")) {
        print("Invocando $methodName...");
        
        // Invocar el método dinámicamente
        var resultado = im.invoke(symbol, []).reflectee;
        
        print("$methodName: \$${resultado ?? 0}");
      }
    }
  });
}

  double calcularCosto() {
    double costo = gc.cantidadPersonas() * gc.costoHora() * gc.horas();
    return costo;
  }

  double calcularGastos() {
    double gastos = gg.papeleria() + gg.serviciosFijos();
    return gastos;
  }

  double calcularRiesgo() {
    double costo = calcularCosto(); // Costo ya calculado
    double gastos = calcularGastos(); // Gastos ya calculados
    double riesgo = 0.5 * (costo + gastos);
    return riesgo;
  }

  double calcularGanancia() {
    double costo = calcularCosto();
    double gastos = calcularGastos();
    double riesgo = calcularRiesgo();
    return 0.2 * (costo + gastos + riesgo);
  }

  double calcularImpuestos() {
    double impuestos = gi.iva() + gi.reteica() + gi.retencionFuente();
    return impuestos;
  }
}


