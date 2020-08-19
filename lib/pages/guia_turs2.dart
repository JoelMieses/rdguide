

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class Guia2Page extends StatelessWidget {
  // static final String path = "lib/src/pages/profile/profile3.dart";

  // final image =
  //     'https://besthqwallpapers.com/Uploads/14-4-2018/48290/thumb2-lionel-messi-argentina-portrait-joy-smile.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset('assets/joel.jpg',fit: BoxFit.cover)
                // child: Image.network(
                //   image,
                //   fit: BoxFit.cover,
                // )
                ),
            Container(
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
                                    "Joel Mieses",
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
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: <Widget>[
                                  //     Icon(Icons.star, color: Colors.yellow),
                                  //     Icon(Icons.star, color: Colors.yellow),
                                  //     Icon(Icons.star, color: Colors.yellow),
                                  //     Icon(Icons.star, color: Colors.yellow),
                                  //     Icon(Icons.star_half,
                                  //         color: Colors.yellow)
                                  //   ],
                                  // ),
                                  // Expanded(
                                  //   child: Column(
                                  //     children: <Widget>[
                                  //       Text("285"),
                                  //       Text("Likes")
                                  //     ],
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: Column(
                                  //     children: <Widget>[
                                  //       Text("3025"),
                                  //       Text("Comments")
                                  //     ],
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: Column(
                                  //     children: <Widget>[
                                  //       Text("650"),
                                  //       Text("Favourites")
                                  //     ],
                                  //   ),
                                  // ),
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
                                image: AssetImage('assets/joel.jpg'))),
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
                            "Email",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("JoelMieses@gmail.com",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                          leading: Icon(Icons.email),
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
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text(
                            "Sitio Web",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("https://www.RDGuide.com",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text(
                            "Actividades",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('''
Recepción de los visitantes nacionales y extranjeros. 

Acompañamiento de turistas. 

Manejo de presupuesto de gastos de tour.  

Supervisión de la unidad de transporte.

Elaboración de informes o reportes de tour.

Información veraz, objetiva y clara al público receptor.

Coordinación de los servicios y productos dentro del itinerario del tour.

Asistencia al turista, primeros auxilios y, en caso necesario, coordinación de ingreso del turista a servicios hospitalarios.
                               
Ejecución puntual del programa de actividades establecido por la agencia de viajes o tour operador.''',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                          leading: Icon(Icons.description),
                        ),
                        ListTile(
                          title: Text(
                            "Ubicación",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Jarabacoa",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                          leading: Icon(Icons.location_on),
                        ),
                        ListTile(
                          title: Text(
                            "Idiomas",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Español, Ingles, Francés",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                          leading: Icon(Icons.language),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  size: 40,
                                  color: Colors.blue[800],
                                ),
                                Icon(
                                  FontAwesomeIcons.twitter,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  size: 40,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Comentarios",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Jonathan Rosario: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Joel Mieses.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Luisa Abreu: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Joel Mieses.",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Mario Lozado: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Joel Mieses.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _lansarWhatsapp();
          // Add your onPressed code here!
        },
        label: Text('WhatsApp'),
        icon: Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
    );
  }
   _lansarWhatsapp() async {
    const url = 'https://wa.me/18298662767';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo iniciar $url';
    }
  }
}
