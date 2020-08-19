import 'package:flutter/material.dart';
 

class OpcionGuiasPage extends StatefulWidget {
  @override
  _OpcionGuiasPage createState() => new _OpcionGuiasPage();
}

class _OpcionGuiasPage extends State<OpcionGuiasPage> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guías'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
  children:  <Widget>[
       Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue,),
              title: Text('Argeni Estévez'),
              onTap: (){
                Navigator.pushNamed(context, '/guia1');
              },
              //subtitle: Text('Breve descripción'),
              //trailing: Icon(Icons.more_vert),                    
            ), 
      ),
       Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green,),
              title: Text('Joel Miese'),
              onTap: (){
                Navigator.pushNamed(context, '/guia2');
              },
              //subtitle: Text('Breve descripción'),
              //trailing: Icon(Icons.more_vert),                    
            ), 
      ),
       Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.purple,),
              title: Text('Ricardo Rosario'),
              onTap: (){
                Navigator.pushNamed(context, '/guia3');
              },
              //subtitle: Text('Breve descripción'),
              //trailing: Icon(Icons.more_vert),                    
            ), 
      ),
      // Card(
      //       child: ListTile(
      //         leading: Icon(Icons.person, color: Colors.red,),
      //         title: Text('Luis Jimenes'),
      //         onTap: (){
      //           Navigator.pushNamed(context, '/guia3');
      //         },
      //         //subtitle: Text('Breve descripción'),
      //         //trailing: Icon(Icons.more_vert),                    
      //       ), 
      // ),
      // Card(
      //       child: ListTile(
      //         leading: Icon(Icons.person, color: Colors.orange,),
      //         title: Text('Samuel Canela'),
      //         onTap: (){
      //           Navigator.pushNamed(context, '/guia3');
      //         },
      //         //subtitle: Text('Breve descripción'),
      //         //trailing: Icon(Icons.more_vert),                    
      //       ), 
      // ),

       
   
        ],
      )       
    );
  }

}