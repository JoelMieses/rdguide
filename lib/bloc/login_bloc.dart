
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:rdguide/providers/login_provider.dart';
import 'package:rdguide/services/shared_preferences.dart';

class LoginBloc extends Bloc{


  final StreamController _loginController = StreamController<Usuario>.broadcast();
  Function(Usuario) get _loginSink => _loginController.sink.add;
  Stream<Usuario> get loginStream => _loginController.stream;


  final StreamController _loadingController = StreamController<bool>.broadcast();
  Function(bool) get _loadingSink => _loadingController.sink.add;
  Stream<bool> get loadingStream => _loadingController.stream;





  void enviar(){
    _loadingSink(true);
  }

  void login({@required String correo, @required String clave,@required BuildContext context})async{


     await loginProvider.login(correo: correo, clave: clave)
        .then((result)async{

      _loadingSink(false);
      if(result != null){
        sharedPreferences.saveLogin(result);
        if(result.token != null || result.token.isNotEmpty){
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
      _loginSink(result);

        })
        .catchError((error,stackTrace){
      _loadingSink(false);
      _showSnakBar(error['mensaje'],context);

        });

  }
  _showSnakBar(String msg,BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error!!",style: TextStyle(color: Colors.red,fontSize: 20),),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _loginController.close();
    _loadingController.close();
  }
}