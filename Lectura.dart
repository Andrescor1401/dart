import 'dart:io';

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


} 

