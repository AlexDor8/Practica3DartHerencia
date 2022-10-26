import 'nadar.dart';
import 'oviparo.dart';

import 'animal.dart';


class Pez extends Animal with Nadar, Oviparo{
Pez({
  required String nombre,
  required int patas,
  required String comida,

}):super(nombre,patas, comida);

}