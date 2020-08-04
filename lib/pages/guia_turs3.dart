/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Guia3Page extends StatelessWidget {
  // static final String path = "lib/src/pages/profile/profile3.dart";

  final image =
      'https://www.mundodeportivo.com/r/GODO/MD/p7/Futbol/Imagenes/2020/04/06/Recortada/img_agomezo_20200326-110529_imagenes_md_otras_fuentes_gettyimages-1205035438-kT0F-U48336284567QyD-980x554@MundoDeportivo-Web.jpg';
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
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
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
                                    "Ricardo Rosario",
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
                            "Email",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("RicardoRosario@gmail.com",
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
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab.",
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
                            "Natanael Ramos: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Ricardo Rosario.",
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
                            "Milvia Martínez: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Ricardo Rosario.",
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
                            "Julian Ramirez: Excelente servicio me encanto la forma en como das las informaciones, el turs y lo dinamico que eres, sigue así Ricardo Rosario.",
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
          // Add your onPressed code here!
        },
        label: Text('WhatsApp'),
        icon: Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
    );
  }
}
