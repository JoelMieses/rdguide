import 'package:flutter/material.dart';
import 'package:rdguide/bloc/lugares_bloc.dart';
import 'package:rdguide/models/categoria.dart';
import 'package:rdguide/models/lugares.dart';
import 'package:rdguide/providers/categorias_provider.dart';
import 'package:rdguide/widgets/swiper_widget.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  final bloc = LugaresBloc();

  String idLugar = "";

  @override
  Widget build(BuildContext context) {
    final dynamic lugar = ModalRoute.of(context).settings.arguments;

    String idelemento = lugar?.id;

    setState(() {
      idLugar = idelemento;
    });

    bloc.getsLugares(idelemento);
    bloc.getCategorias();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            child: Hero(
              tag: lugar.img.toString(),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/loading.gif"),
                image: NetworkImage("${lugar.img}"),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 280),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        "${lugar.nombre}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                   /* IconButton(
                      color: Colors.white,
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border),
                      ),
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
                      _crearAcciones(bloc),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Text(
                          lugar.descripcion,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _swiperLugares(
                        "Lugares Recomendados",
                        bloc,
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

  void irDestino(dynamic destino) {
    Navigator.pushNamed(context, '/hotel', arguments: destino);
  }

  Widget _swiperLugares(String titulo, LugaresBloc bloc) {
    return StreamBuilder(
      stream: bloc.lugaresStream,
      builder: (context, AsyncSnapshot<List<Lugar>> snapshot) {
        final result = snapshot.data;
        if (snapshot.hasData) {
          return SwiperWidget(
            titulo: titulo,
            elementos: result,
            onTap: irDestino,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _crearAcciones(LugaresBloc bloc) {
    return StreamBuilder(
        stream: bloc.categoriasStream,
        builder: (context, AsyncSnapshot<List<Categoria>> snapshot) {
          if (snapshot.hasData) {
            final lista = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _accion(lista.firstWhere((e) => e.id == 1)),
                _accion(lista.firstWhere((e) => e.id == 2)),
                _accion(lista.firstWhere((e) => e.id == 5)),
                _accion(lista.firstWhere((e) => e.id == 7)),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            );
          }
        });
  }

  Widget _accion(Categoria categoria) {
    categoria.lugar = idLugar;
    return GestureDetector(
      onTap: () {
        if(categoria.id == 7){
          Navigator.of(context).pushNamed('/opcionguias');
        }
       else Navigator.of(context).pushNamed('/resultado', arguments: categoria);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            categoria.img,
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categoria.nombre,
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
