import 'animal.dart';
import 'oviparo.dart';
import 'viviparo.dart';
import 'volar.dart';

class Mamifero extends Animal with Volar, Viviparo, Oviparo{
  Mamifero({
  required String nombre,
  required int patas,
  required String comida,

}):super(nombre,patas, comida);
}