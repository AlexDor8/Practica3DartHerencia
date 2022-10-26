class Animal {
  final String nombre;
  final int patas;
  final String comida;


  Animal(this.nombre,this.patas,this.comida);


  String toString(){
    return "($nombre, numero de patas: $patas, comida: $comida)";
  } 
}

