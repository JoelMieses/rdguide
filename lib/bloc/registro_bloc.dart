


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
        if(result.id != "0" ){
         // Navigator.pop(context);
        }
      }
      _registroSink(result);

    })
        .catchError((error,stackTrace){
      _loadingSink(false);
      _errorSink(error['mensaje']);

    });

  }

  @override
  void dispose() {
    _registroController.close();
    _loadingController.close();
    _errorController.close();
  }




}