


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:rdguide/providers/registro_provider.dart';

class RegistroBloc extends Bloc{




  final StreamController _registroController = StreamController<Usuario>.broadcast();
  Function(Usuario) get _registroSink => _registroController.sink.add;
  Stream<Usuario> get registroStream => _registroController.stream;


  final StreamController _loadingController = StreamController<bool>.broadcast();
  Function(bool) get _loadingSink => _loadingController.sink.add;
  Stream<bool> get loadingStream => _loadingController.stream;

  final StreamController _errorController = StreamController<String>.broadcast();
  Function(String) get _errorSink => _errorController.sink.add;
  Stream<String> get errorStream => _errorController.stream;



  void enviar(){
    _loadingSink(true);
  }

  void registro({@required Usuario usuario,@required BuildContext context})async{


    await registroProvider.postRegistro(usuario)
        .then((result)async{

      _loadingSink(false);
      if(result != null){
        if(result is Usuario){
         _showAlert( context);
        }
      }
      _registroSink(result);

    })
        .catchError((error,stackTrace){
      _loadingSink(false);
      print(error);
      _showError(error['mensaje'],context);

    });

  }

  _showAlert(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Felicidades!!",style: TextStyle(color: Colors.green,fontSize: 20),),
          content: Text("Usuario registrado Correctamente"),
          actions: <Widget>[
            FlatButton(
              child: Text('Iniciar Sesion'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  _showError(String msg,BuildContext context) {
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
    _registroController.close();
    _loadingController.close();
    _errorController.close();
  }




}