import 'package:flutter/material.dart';

class PerfilNewPage extends StatelessWidget {

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
                          subtitle: Text("Ricardo Rosario",
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
                          subtitle: Text("Masculino",
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
                          subtitle: Text("25/09/1992",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              )),
                        ),
                        ListTile(
                          title: Text(
                            "Edad",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("27",
                              textAlign: TextAlign.justify,
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
                          subtitle: Text("RicardoRosario@gmail.com",
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
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}


