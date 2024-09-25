
import 'Lectura.dart';
class GestionarCostos {
  Lectura l = new Lectura();
  
   late int personas;
   late double precioHora;
   late int cantidadHoras;

  // Método para solicitar los datos
  void solicitarDatos() {
    personas = l.leerI("Ingrese la cantidad de personas a necesitar: ");
    precioHora = l.leerDouble("Ingrese el valor de la hora de las personas: ");
    cantidadHoras = l.leerI("Ingrese la cantidad de horas necesarias para desarrollar el proyecto: ");
  }

  int cantidadPersonas() {
    return personas;
  }

  double costoHora() {
    return precioHora;
  }

  int horas() {
    return cantidadHoras;
  }
}

