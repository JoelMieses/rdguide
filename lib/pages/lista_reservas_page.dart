


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaReservasPage extends StatefulWidget{
  @override
  _ListaReservasPageState createState() => _ListaReservasPageState();
}

class _ListaReservasPageState extends State<ListaReservasPage> {
  @override
  Widget build(BuildContext context) {
      return ListView(
        children:  <Widget>[
          SizedBox(height: 20,),
          Card(
            child: ListTile(
              leading: Icon(Icons.calendar_today,color: Colors.blue,),
              title: Text('Restaurant Altavista',overflow: TextOverflow.ellipsis,),
              subtitle: Text('Jarabacoa    30/10/2020 - 31/10/2020'),
              //trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.calendar_today,color: Colors.blue,),
              title: Text('Hotel Gran Jimenoa - Suite Deluxe',overflow: TextOverflow.ellipsis,),
              subtitle: Text('Jarabacoa    22/10/2020 - 24/10/2020'),
              //trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      )  ;
  }
}