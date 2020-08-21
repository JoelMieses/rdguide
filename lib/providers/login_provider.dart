
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:rdguide/providers/utils_provider.dart';

class _loginProvider {

  final _url = UtilProvider.getUrl;

  Future<bool> isLogged() async{

  }

  Future<Usuario> getUsuario() async{

  }

  Future<Usuario> login({@required String correo,@required String clave}) async{
     Usuario usuario = Usuario();

    final url = Uri.http(_url, "/GetAcceso/$correo,$clave");

    final resp = await http.get(url);

    print(resp.body);

    if(resp.statusCode == 200){


      final dataJson = resp.body;
      final dataMap = json.decode(dataJson);

      if(dataMap['item1']=='false'){
        return Future.error({"mensaje":"Usuario o contraseña invalido"});}

      print(dataMap['item1']);
      usuario = Usuario.fromJson(dataMap['item2'][0]);



    }
    return usuario;

  }
  Future<Usuario> registro(Usuario usuario) async{

  }

}
final loginProvider = new _loginProvider();



