import 'Lectura.dart';
class Gestionargastos {
  Lectura l = new Lectura();
  
  late double gastosPapeleria;
  late int servicios;

  // Método para solicitar los datos
  void solicitarDatos() {
    gastosPapeleria = 100000;
    servicios = 850000; 
  }

  double papeleria() {
    return gastosPapeleria;
  }

  int serviciosFijos() {
    return servicios;
  }
}


