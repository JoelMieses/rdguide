import 'package:flutter/material.dart';

class SeguridadPage extends StatefulWidget {
  @override
  _SeguridadPage createState() => new _SeguridadPage();
}

class _SeguridadPage extends State<SeguridadPage> {

  //static final  String routeName = 'notificacion';

  bool autentificacion = true;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguridad'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top:  10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _cambiarPass(),
              SizedBox(),
              //Divider(),
              __switchAutentificacion(),
            ],
          ),
        ),
      ),
    );
  }

  _cambiarPass(){
    return Container(
      width: double.infinity,
      height: 50.0,
      child: FlatButton(
        textColor: Colors.black,
        splashColor: Colors.grey,
        onPressed: () {
          Navigator.pushNamed(context, '/cambiarPass');
        },
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Cambiar Contraseña", style: TextStyle(fontSize: 18.0),)),
      ),
    );
  }

 Widget __switchAutentificacion(){
     return SwitchListTile(
        title: Text('Autentificación en dos pasos'),
        value: autentificacion,
        onChanged: (value){
          setState(() {
            autentificacion = value;
          });
        }
      );
  }
}