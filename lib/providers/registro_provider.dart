import 'dart:convert';

import 'package:rdguide/models/usuario.dart';
import 'package:rdguide/providers/utils_provider.dart';
import 'package:http/http.dart' as http;

class _registroProvider {

  final _url = UtilProvider.getUrl;

  Future<Usuario> postRegistro(Usuario usuario)async{
    Usuario usuariores = new Usuario();
    final url = Uri.http(_url, "/SetCliente");

    final Map<String,String> header = {"Token":"mn3db5NQVU5fYWeBJKscUQ==","Content-Type": "application/json"};
    final body = json.encode(usuario.toJson());

    print("el header${header}");


    final result = await http.post(url,headers: header,body: body);
    print(body);

    print(result.statusCode);

    if(result.statusCode == 200){


      final dataJson = result.body;

      print(dataJson);
      final dataMap = json.decode(dataJson);
      print("El Mensaje \n\n $dataMap");

      usuariores = Usuario.fromJson(dataMap);

      print(usuariores.toString());
      return usuariores;

    } else {
      print("Hay un errror");
        return Future.error({"mensaje":"Usuario no se pudo registrar\n ${result.reasonPhrase}"});
    }

  }

}
final registroProvider = new _registroProvider();