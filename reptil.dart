import 'nadar.dart';
import 'oviparo.dart';

import 'animal.dart';


class Reptil extends Animal with Nadar, Oviparo{
Reptil({
  required String nombre,
  required int patas,
  required String comida,

}):super(nombre,patas, comida);

}