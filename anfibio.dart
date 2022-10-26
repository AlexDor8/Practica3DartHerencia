import 'nadar.dart';
import 'oviparo.dart';

import 'animal.dart';


class Anfibio extends Animal with Nadar, Oviparo{
Anfibio({
  required String nombre,
  required int patas,
  required String comida,

}):super(nombre,patas, comida);

}