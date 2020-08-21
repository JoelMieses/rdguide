import 'dart:convert';


class Reserva {
  Reserva({
    this.idreserva,
    this.idcliente,
    this.idarea,
    this.cantidad,
    this.personas,
    this.desde,
    this.hasta,
    this.comentario,
  });

  int idreserva;
  int idcliente;
  int idarea;
  int cantidad;
  int personas;
  String desde;
  String hasta;
  String comentario;
  //String token;

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
    idreserva: int.parse(json["idreserva"].toString()),
    idcliente:int.parse( json["idcliente"].toString()),
    idarea: int.parse(json["idarea"].toString()),
    cantidad: int.parse(json["cantidad"].toString()),
    personas:int.parse( json["personas"].toString()),
    desde: json["desde"],
    hasta: json["hasta"],
    comentario: json["comentario"],
    //token: json["token"],
  );
  /*factory Reserva.toPost(){

  }*/

  Map<String, dynamic> toJson() => {
    "idreserva": idreserva,
    "idcliente": idcliente,
    "idarea": idarea,
    "cantidad": cantidad,
    "personas": personas,
    "desde": desde,
    "hasta": hasta,
    "comentario": comentario,
  };

  @override
  String toString() {
    return 'Reserva{idreserva: $idreserva, idcliente $idcliente, idarea: $idarea, cantidad: $cantidad, personas: $personas, desde: $desde, hasta: $hasta, comentario: $comentario}';
  }
}
