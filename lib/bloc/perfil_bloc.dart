import 'dart:async';

import 'package:rdguide/bloc/bloc.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:rdguide/services/shared_preferences.dart';

class PerfilBloc extends Bloc{


  final StreamController _perfilController = StreamController<Usuario>.broadcast();
  Function(Usuario) get _perfilSink => _perfilController.sink.add;
  Stream<Usuario> get perfilStream => _perfilController.stream;





  void getUsuario()async{

    final Usuario user = await sharedPreferences.getUsuario();
    _perfilSink(user);

      }

  @override
  void dispose() {
    _perfilController.close();
  }

  }
