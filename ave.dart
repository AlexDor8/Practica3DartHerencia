import 'animal.dart';
import 'volar.dart';

class Ave extends Animal with Volar{
  Ave({
    required String nombre,
    required int patas,
    required String comida,
  }):super(nombre, patas, comida);
}