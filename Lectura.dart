/*import 'dart:io';

class Lectura {

  leerI(String mensaje){
  int dato;
  stdout.write(mensaje);
  dato = int.parse(stdin.readLineSync()!);
  return dato;
  }
  leerDouble(String mensaje){
    double dato;
    print(mensaje);
    dato = double.parse(stdin.readLineSync()!);
    return dato;
  }
  leerString(String mensaje){
    String? dato;
    stdout.write(mensaje);
    dato = stdin.readLineSync();
    return dato;
  }


} */
import 'dart:io';

class Lectura {
  int leerI(String mensaje) {
    int? dato;
    while (dato == null) {
      stdout.write(mensaje);
      try {
        dato = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print("Error: Por favor, ingrese un número entero válido.");
      }
    }
    return dato;
  }

  double leerDouble(String mensaje) {
    double? dato;
    while (dato == null) {
      stdout.write(mensaje);
      try {
        dato = double.parse(stdin.readLineSync()!);
      } catch (e) {
        print("Error: Por favor, ingrese un número decimal válido.");
      }
    }
    return dato;
  }

  String leerString(String mensaje) {
    String? dato;
    while (dato == null || dato.isEmpty) {
      stdout.write(mensaje);
      dato = stdin.readLineSync();
      if (dato == null || dato.isEmpty) {
        print("Error: Por favor, ingrese un texto válido.");
      }
    }
    return dato;
  }
}


