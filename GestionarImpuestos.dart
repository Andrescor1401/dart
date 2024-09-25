
import 'Calcular.dart';

class GestionarImpuestos {
  Calcular cl;

  GestionarImpuestos(this.cl);

  double retencionFuente() {
    double retencionFuente = ((cl.calcularCosto() + cl.calcularGastos() + cl.calcularGanancia() + cl.calcularRiesgo()) * 0.11);
    return retencionFuente;
  }

  double reteica() {
    double rete = retencionFuente() * 0.01;
    return rete;
  }

  double iva() {
    return 0.19 * (retencionFuente() + reteica() + cl.calcularCosto() + cl.calcularGastos() + cl.calcularGanancia() + cl.calcularRiesgo());
  }
}
