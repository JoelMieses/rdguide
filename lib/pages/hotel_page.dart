import 'package:flutter/material.dart';
import 'package:rdguide/models/lugares.dart';

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    final Lugar lugar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/MapaG');
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.location_on),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.network(lugar.img, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "${lugar.nombre}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
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
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                     /* child: Text(
                        "8.4/85 opiniones",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),*/
                    ),
                    Spacer(),
                   /* IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )*/
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.green,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.green,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.green,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.green,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: "8 km del centro")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "\$" + "${lugar.preciodesde}",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "/por noche",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text(
                            "Reservar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/hotel/areas', arguments: lugar);
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Acerca de",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        lugar.descripcion,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
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
