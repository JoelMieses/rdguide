



import 'package:flutter/material.dart';
import 'package:rdguide/models/areas.dart';
import 'package:rdguide/models/lugares.dart';

class HotelDetalleArea extends StatefulWidget {

  @override
  _HotelDetalleAreaState createState() => _HotelDetalleAreaState();
}

class _HotelDetalleAreaState extends State<HotelDetalleArea> {


  @override
  Widget build(BuildContext context) {
    final Area area = ModalRoute.of(context).settings.arguments;
    print(area);
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child: Image.network(area.img, fit: BoxFit.cover)),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 210),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(area.nombre,
                    style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),                      
                     
                    ),
                    
                    
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                     
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text("Reservar ahora", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/realizarreserva',arguments: area);},
                          ),
                      ),
                      const SizedBox(height: 30.0),
                      Text("Descripcion", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(area.descripcion, textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      SizedBox(height: 20,),
                      Text("Caracteristicas", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      Text(area.caracteristicas, textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      

                    ],
                  ),
                ),
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
}