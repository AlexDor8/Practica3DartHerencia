/// Support for doing something awesome.
///
/// More dartdocs go here.
library tienda_animales;

import 'dart:io';

import 'anfibio.dart';
import 'animal.dart';

import 'ave.dart';
import 'mamifero.dart';
import 'pez.dart';
import 'reptil.dart';

export 'tienda_animales_base.dart';

// TODO: Export any libraries intended for clients of this package.

late List<Animal> animales;

void main(List<String> args) {
  introducirAnimales();
  ordenarAlfabeticamente();
  tipoComida();
  animalesVoladores();
  deleteAnimal(Animal);
  animalEditado();
  crearAnimalesPorConsola();
  ordenarAlfabeticamente();
}

void introducirAnimales() {
  Mamifero mono1 = Mamifero(nombre: "Chimpance", patas: 4, comida: "Omnivoro");
  Mamifero mono2 = Mamifero(nombre: "Macaco", patas: 4, comida: "Omnivoro");
  Mamifero perro1 =
      Mamifero(nombre: "Chiguagua", patas: 4, comida: "Carnivoro");
  Mamifero gato1 = Mamifero(nombre: "Egipcio", patas: 4, comida: "Carnivoro");
  Mamifero murciealgo =
      Mamifero(nombre: "Murcielago", patas: 4, comida: "Omnivoro");
  murciealgo.puedeVolar = true;
  Ave pajaro1 = Ave(nombre: "Colibri", patas: 2, comida: "Hervivoro");
  pajaro1.puedeVolar = true;
  Ave pajaro2 = Ave(nombre: "Avejarucos", patas: 2, comida: "Hervivoro");
  pajaro2.puedeVolar = true;
  Ave pajaro3 = Ave(nombre: "Pingüino", patas: 2, comida: "Carnivoro");
  pajaro3.puedeVolar = false;
  Ave pajaro4 = Ave(nombre: "Kiwi", patas: 2, comida: "Omnivoro");
  pajaro4.puedeVolar = false;
  Reptil cocodrilo1 = Reptil(nombre: "Caiman", patas: 4, comida: "Carnivoro");
  Reptil serpiente = Reptil(nombre: "Anaconda", patas: 0, comida: "Carnivoro");
  Mamifero delfin = Mamifero(nombre: "Delfin", patas: 0, comida: "Carnivoro");
  Pez dorada = Pez(nombre: "Pez Dorado", patas: 0, comida: "Omnivoro");
  Anfibio rana = Anfibio(nombre: "Rana", patas: 4, comida: "Carnivoro");
  animales = [
    mono1,
    mono2,
    murciealgo,
    pajaro1,
    pajaro2,
    pajaro3,
    delfin,
    dorada,
    pajaro4,
    perro1,
    gato1,
    cocodrilo1,
    serpiente,
    rana
  ];
}

void ordenarAlfabeticamente() {
  print("Lista ordenada alfabeticamente:");
  animales.sort(((a, b) => a.nombre.compareTo(b.nombre)));
  print(animales);
}

void tipoComida() {
  List<Animal> carnivoro = [];
  List<Animal> hervivoro = [];
  List<Animal> omnivoro = [];
  for (int i = 0; i < animales.length; i++) {
    if (animales[i].comida == "Carnivoro") {
      carnivoro.add(animales[i]);
    } else if (animales[i].comida == "Hervivoro") {
      hervivoro.add(animales[i]);
    } else if (animales[i].comida == "Omnivoro") {
      omnivoro.add(animales[i]);
    }
  }
  print("Carnivoros: $carnivoro");
  print("Hervivoros: $hervivoro");
  print("Omnivoro: $omnivoro");
}

List<Animal> getAnimalesVoladores(animales) {
  List<Animal> animalesVoladores = [];
  for (int i = 0; i < animales.length; i++) {
    if (animales[i] is Ave && animales[i].puedeVolar ||
        animales[i] is Mamifero && animales[i].puedeVolar) {
      animalesVoladores.add(animales[i]);
    }
  }
  return animalesVoladores;
}

void animalesVoladores() {
  print("Animales voladores: ${getAnimalesVoladores(animales)}");
}

void deleteAnimal(Animal) {
  animales.remove(Animal);
}

void updateAnimal(Animal oldAnimal, Animal newAnimal) {
  for (int i = 0; i < animales.length; i++) {
    if (animales[i] == oldAnimal) {
      animales[i] = newAnimal;
    }
  }
}

void animalEditado() {
  Ave newAnimal = Ave(nombre: "Avejaruco", patas: 2, comida: "Hervivoro");
  updateAnimal(animales[1], newAnimal);
  print("Animal editado:");
  print(newAnimal);
}

void getAnimalesPorTipo(int tipo, String nombre, int patas, String comida) {
  switch (tipo) {
    case 1:
      {
        Mamifero nuevoMamifero =
            Mamifero(nombre: nombre, patas: patas, comida: comida);
        animales.add(nuevoMamifero);
        break;
      }
    case 2:
      {
        Ave nuevaAve = Ave(nombre: nombre, patas: patas, comida: comida);
        animales.add(nuevaAve);
        break;
      }
    case 3:
      {
        Reptil nuevoReptil =
            Reptil(nombre: nombre, patas: patas, comida: comida);
        animales.add(nuevoReptil);
        break;
      }
    case 4:
      {
        Pez nuevoPez = Pez(nombre: nombre, patas: patas, comida: comida);
        animales.add(nuevoPez);
        break;
      }
    case 5:
      {
        Anfibio nuevoAnfibio =
            Anfibio(nombre: nombre, patas: patas, comida: comida);
        animales.add(nuevoAnfibio);
        break;
      }
  }
}

String alimentacion(int tipoDeComida) {
  String comida = "";
  switch (tipoDeComida) {
    case 1:
      {
        comida = "Carnivoro";
        break;
      }
    case 2:
      {
        comida = "Hervivoro";
        break;
      }
    case 3:
      {
        comida = "Omnivoro";
        break;
      }
  }
  return comida;
}

void crearAnimalesPorConsola() {
  stdout.writeln("¿Cuantos animales quieres crear?");
  int? cantidadAnimales = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < cantidadAnimales; i++) {
    stdout.writeln(
        "¿Qué tipo de animal quieres crear? (Introduce el numero que corresponda) \n 1. Mamifero \n 2. Ave \n 3. Reptil \n 4. Pez \n 5. Anfibio");
    int tipo = int.parse(stdin.readLineSync()!);
    stdout.writeln("Nombre del animal:");
    String nombre = stdin.readLineSync()!;
    stdout.writeln("Numero de patas:");
    int patas = int.parse(stdin.readLineSync()!);
    stdout.writeln(
        "Tipo de alimentación: (Introduce el numero que corresponda) \n 1. Carnivoro \n 2. Hervivoro \n 3. Omnivoro");
    int tipoDeComida = int.parse(stdin.readLineSync()!);
    getAnimalesPorTipo(tipo, nombre, patas, alimentacion(tipoDeComida));
  }
}
