import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/destinos_populares_bloc.dart';
import 'package:rdguide/buscador/buscador.dart';
import 'package:rdguide/models/destino.dart';
import 'package:rdguide/models/eventos.dart';
import 'package:rdguide/models/publicidad.dart';
import 'package:rdguide/widgets/portada_widget.dart';
import 'package:rdguide/widgets/swiper_widget.dart';


class InicioPage extends StatefulWidget{

  @override
  InicioPageState createState() =>InicioPageState();
}


class InicioPageState extends State<InicioPage>{
  final bloc = DestinosPopularesBloc();
  @override
  Widget build(BuildContext context) {
   getDatos(bloc);
    return BlocProvider(
      bloc: bloc,
      child: SingleChildScrollView(
        child: Column(
        children: <Widget>[
         // _search(),
          header(),
          _portadaPublicidad(bloc),
          SizedBox(height: 10.0,),
         _swiperPopulares("Destinos Populares",bloc),
         _swiperEventos("Eventos",bloc)
          /*Expanded(
            child: Container(
                child:
                StreamBuilder(
                  stream: destinoProvider.popularesStream,
                  builder: (BuildContext context,AsyncSnapshot<List> list){
                    if(!list.hasData) return Container(
                      height: MediaQuery.of(context).size.height,
                      child: CircularProgressIndicator(),
                    );
                    else{
                      return   ListView(
                          children: items(list.data)
                      );}
                  },
                )
            ),
          ),*/
        ],
        ),
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[          
          Text("Bienvenidos", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,color: Colors.black45),),
          Spacer(),
          GestureDetector(
            onTap: (){
              showSearch(context: context, delegate: BuscarCiudad());
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              child: Icon(Icons.search,color: Colors.black87,),
            ),
          ),

        ],
      ),
    );
  }

  void getDatos(DestinosPopularesBloc bloc){
    bloc.getPopulares();
    bloc.getPublicidad();
    bloc.getEventosPrincipales();
  }
  Widget _portadaPublicidad(DestinosPopularesBloc bloc){
    return StreamBuilder(
      stream: bloc.publicidadStream,
      builder: (context,AsyncSnapshot<List<Publicidad>> snapshot){
        var result = List<Publicidad>();
        if(snapshot.hasData){
          result = snapshot.data;
          return PortadaWidget(resultados: result,);
        }else{
          return PortadaWidget();
        }
    },
    );
  }

  Widget _swiperPopulares(String titulo ,DestinosPopularesBloc bloc){
    return   StreamBuilder(
              stream: bloc.popularesStream,
              builder: (context, AsyncSnapshot<List<Destino>> snapshot){
                final result = snapshot.data;
                if(snapshot.hasData){
                  return SwiperWidget(titulo: titulo,elementos: result,onTap:irDestino ,);
                }else{
                  return Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
      },
    );
}
void irDestino(dynamic destino){
    Navigator.pushNamed(context, '/portadaDestino',arguments: destino);
}

void irEvento(dynamic destino){
    Navigator.pushNamed(context, '/evento',arguments: destino);
}

  Widget _swiperEventos(String titulo ,DestinosPopularesBloc bloc){
    return  StreamBuilder(
        stream: bloc.eventosPrincipalesStream,
        builder: (context, AsyncSnapshot<List<Evento>> snapshot){
          final result = snapshot.data;
          if(snapshot.hasData){
            return SwiperWidget(titulo: titulo,elementos: result,onTap: irEvento,);
          }else{
            return Container(
              height: MediaQuery.of(context).size.height*0.2,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
    );
  }

  Widget _search(){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffE1E2E4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Buscar destinos",
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                      prefixIcon: Icon(Icons.search, color: Colors.black54)),
                  onChanged: (text){
                    showSearch(context: context, delegate: BuscarCiudad(),query: text);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
/*
  List<Widget> items(List<Destino>list){

    final List<Widget> destinos = [];

    list.forEach((p) {
      destinos.add(CardLugar(p.nombre,p.visitas,p.descripcion));
    });

    return destinos;
  }*/
}