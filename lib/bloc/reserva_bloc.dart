


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc.dart';
import 'package:rdguide/models/reserva.dart';
import 'package:rdguide/providers/reserva_provider.dart';

class ReservaBloc extends Bloc{




  final StreamController _reservaController = StreamController<Reserva>.broadcast();
  Function(Reserva) get _reservaSink => _reservaController.sink.add;
  Stream<Reserva> get reservaStream => _reservaController.stream;


  final StreamController _loadingController = StreamController<bool>.broadcast();
  Function(bool) get _loadingSink => _loadingController.sink.add;
  Stream<bool> get loadingStream => _loadingController.stream;

  final StreamController _errorController = StreamController<String>.broadcast();
  Function(String) get _errorSink => _errorController.sink.add;
  Stream<String> get errorStream => _errorController.stream;



  void enviar(){
    _loadingSink(true);
  }

  void reserva({@required Reserva reserva,@required BuildContext context})async{


    await reservaProvider.postReserva(reserva)
        .then((result)async{

      _loadingSink(false);
      if(result != null){
        if(result.idreserva != 0 ){
          Navigator.popAndPushNamed(context, "/reservacompleta");
        }
      }
      _reservaSink(result);

    })
        .catchError((error,stackTrace){
      _loadingSink(false);
      print(error);
      //_errorSink(error['mensaje']);

    });

  }

  @override
  void dispose() {
    _reservaController.close();
    _loadingController.close();
    _errorController.close();
  }




}