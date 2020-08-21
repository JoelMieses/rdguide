import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';


final String IS_LOGGED = "isLogged";
final String USER_TOKEN = "userToken";
final String NOMBRE = "user_nombre";
final String APELLIDO = "user_apellido";
final String EMAIL = "user_email";
final String SEXO = "user_sexo";
final String FECHANAC = "user_nac";
final String ID = "user_id";
class _SharedPreferences {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  void saveLogin(Usuario user) async{

    final SharedPreferences prefs = await _prefs;

    final userJson = user.toJson();
    String jsonString = json.encode(userJson);


    if(prefs!=null && user !=null){
      print("SharedP ${user.toString()}");
      prefs.setString(NOMBRE, user.nombre);
      prefs.setString(EMAIL, user.email);
      prefs.setString(APELLIDO, user.apellido);
      prefs.setString(SEXO, user.sexo);
      prefs.setString(FECHANAC, user.fechanac);
      prefs.setInt(ID, user.id);
      prefs.setString(USER_TOKEN, user.token);
      prefs.setBool(IS_LOGGED, true);

      print(prefs.getString(USER_TOKEN));

    }
  }

  Future<Usuario> getUsuario() async{
    final SharedPreferences prefs = await _prefs;
    Usuario usuario = Usuario();
    usuario.fechanac =  prefs.getString(FECHANAC);
    usuario.apellido = prefs.getString(APELLIDO);
    usuario.nombre = prefs.getString(NOMBRE);
    usuario.sexo = prefs.getString(SEXO);
    usuario.email = prefs.getString(EMAIL);
    usuario.id = prefs.getInt(ID);

    return usuario;
  }



  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(USER_TOKEN);
  }

  Future<bool> isLogged()async{
    final SharedPreferences prefs = await _prefs;
    final logPref = prefs.getBool(IS_LOGGED);
    if(logPref == null || !logPref){
      return false;
    }else{
      final tokPref = prefs.getString(USER_TOKEN);
      if(tokPref == null || tokPref.isEmpty){
        return false;
      }else{
        return true;
      }
    }
  }

  void logout(BuildContext context) async{
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    Navigator.pushNamed(context, '/login');
  }

}
final sharedPreferences = new _SharedPreferences();