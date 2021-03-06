import 'dart:convert';

import 'package:rdguide/models/reserva.dart';
import 'package:rdguide/providers/utils_provider.dart';
import 'package:http/http.dart' as http;

class _reservaProvider {

  final _url = UtilProvider.getUrl;

  Future<Reserva> postReserva(Reserva reservaP)async{
    Reserva reserva = new Reserva();
    final url = Uri.http(_url, "/SetReserva");

    final Map<String,String> header = {"Token":"mn3db5NQVU5fYWeBJKscUQ==","Content-Type": "application/json"};
    final body = json.encode(reservaP.toJson());

    print("el header${header}");
    print("La Reserva ${reservaP}");

    final result = await http.post(url,headers: header,body: body);


    print(result.body);

    if(result.statusCode == 200){


      final dataJson = result.body;
      final dataMap = json.decode(dataJson);
      print("El Mensaje \n\n $dataMap");

      if(dataMap["idreserva"]=='0'){
        return Future.error({"mensaje":"reserva no se pudo guardar"});}

      print(dataMap);
      reserva = Reserva.fromJson(dataMap);

      print(reserva.toString());

    }
    return reserva;


  }

}
final reservaProvider = new _reservaProvider();