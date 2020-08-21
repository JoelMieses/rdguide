import 'package:flutter/material.dart';

import 'main_pages/inicio_page.dart';

class ReservaHotelPage extends StatelessWidget {

  //aqui se cargan los estilos que se usan para la parte de los textos
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Reserva Completada'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //aqui se crean los metodos
          children: <Widget>[    
            SizedBox(height:90.0), 
            _crearImagen(),
            SizedBox(height:20.0),
            _creartitulo(),
            SizedBox(height:20.0),
            _volver(context)
            // _crearAcciones(),
          ],
        ),
      )
    );
    
  }
    //esta es la imagen que se muestra dentro de la pagina
    Widget _crearImagen(){
      return  Center(
        child: Container(
          height: 300.0,
          child: Image.asset('assets/Rd-reserva.png'),
        ),
      );
  
    }
  
  //este es el articulos que se muestra en la pagina
  Widget _creartitulo(){

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Reserva Completada' , style: estiloTitulo),
                  SizedBox(height: 2.0),
                  Text('Verifique su bandeja de notificaciones', style: estiloSubtitulo)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //este es el boton que se muestra en la pagina
  Widget _volver(BuildContext context){

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('Volver'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: (){
        Navigator.pushReplacementNamed(context, "/home");
      },
    );
  }

}