import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/perfil_bloc.dart';
import 'package:rdguide/models/usuario.dart';

class PerfilNewPage extends StatelessWidget {

  final image =
      'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png';
  @override
  Widget build(BuildContext context) {
    final bloc = PerfilBloc();
    bloc.getUsuario();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: BlocProvider(
          bloc: bloc,
          child: Stack(
            children: <Widget>[
              SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    "https://www.inoutviajes.com/fotos/20/8857_Seven_Mile.jpg",
                    fit: BoxFit.cover,
                  )),
                  _perfilInfo(bloc),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _perfilInfo(PerfilBloc bloc){
    return StreamBuilder(
        stream: bloc.perfilStream,
        builder: (context,AsyncSnapshot<Usuario> snapshot){
        if(!snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            child: Center(
            child: CircularProgressIndicator(),),
          );
        } else{
          final usuario = snapshot.data;
          return Container(
            margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 96.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${usuario.nombre} ${usuario.apellido}",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                // ListTile(
                                //   contentPadding: EdgeInsets.all(0),
                                //   title: Text("Product Designer"),
                                //   subtitle: Text("Kathmandu"),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                      margin: EdgeInsets.only(left: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "Información",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          "Nombre",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${usuario.nombre} ${usuario.apellido}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          "Sexo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${getSexo(usuario.sexo)}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          "Fecha de Nacimiento",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${usuario.fechanac}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            )),
                      ),
                      
                      ListTile(
                        title: Text(
                          "Télefono",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("809-xxx-xxxx",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${usuario.email}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            )),
                      ),
                      RaisedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 15.0),
                          child: Text(
                            'Actualizar Datos',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 0.0,
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/actualizarDatos');
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    });
  }

  String getSexo(String sex){
    if(sex != null && sex.isNotEmpty){
    switch(sex.toUpperCase()){
      case "F":{return "Femenino";}
      case "M":{return "Masculino";}
      default: {
        return "N/A";
      }
    }}
    return "N/A";
  }

}


