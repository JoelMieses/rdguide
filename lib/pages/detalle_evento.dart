
import 'package:flutter/material.dart';
import 'package:rdguide/bloc/eventos_bloc.dart';
import 'package:url_launcher/url_launcher.dart';




class EventoPage extends StatefulWidget {
  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
final bloc = EventosBloc();

String idLugar="";

  @override
  Widget build(BuildContext context) {
    final dynamic evento = ModalRoute.of(context).settings.arguments;

    String idelemento = evento?.id;

    setState(() {
      idLugar = idelemento;
    });

    bloc.getEventosPrincipales(idelemento);
   
    return Scaffold(

      body:Stack(
        children: <Widget>[

          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child:  Hero(
                tag: evento.img.toString(),
                child: FadeInImage(
                  fit: BoxFit.cover,
                    placeholder: AssetImage("assets/loading.gif"),
                    image: NetworkImage("${evento.img}"),
                  ),
              ),),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 280),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:0.0),

                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        "${evento.nombre}",overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    /*IconButton(
                      color: Colors.white,
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border),
                      ) ,
                      onPressed: () {},
                    )*/
                  ],
                ),
                Container(
                  
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 20.0),                      
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Text(evento.descripcion,textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0
                      ),
                        ),
                      ),
                      
                      
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text("Contacto", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 60.0,
                            ),
                            onPressed: () {
                              _lansarllamada();},
                          ),
                )
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
    
  }




void irDestino(dynamic destino){
    Navigator.pushNamed(context, '/portadaLugar',arguments: destino);
}




/*
_lansarWhatsapp() async {
  const url = 'https://wa.me/18298662767';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo iniciar $url';
  }
}
*/
_lansarllamada() async {
    const url = "tel:18298662767";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'No se pudo iniciar $url';
    }   
}




}