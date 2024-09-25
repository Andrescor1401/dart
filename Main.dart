
import 'GestionarCalculadora.dart';

  void main(List<String> args) {
  Gestionarcalculadora gescal = Gestionarcalculadora();
  
  // Primero inicia el cálculo y solicita los datos en el orden correcto
  gescal.cal.iniciarCalculo();
  

  // Luego realiza los cálculos
  gescal.crearCalculo();
  
  
  // Y finalmente muestra los resultados
  //gescal.mostrarResultados();
  gescal.mostrarResultadosReflexivo();
  gescal.cal.invocarMetodosDinamicos();
}




