import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/reserva_bloc.dart';
import 'package:rdguide/models/reserva.dart';
import 'package:intl/intl.dart';


class RealizarReservaPage extends StatefulWidget {
  @override
  _RealizarReservaPageState createState() => _RealizarReservaPageState();
}

Reserva reserva = new Reserva();
String claveError;


final _formKey = GlobalKey<FormState>();

class _RealizarReservaPageState extends State<RealizarReservaPage> {

  String _fecha = '';

  final _nombreController = new TextEditingController();
  final _apellidoController = new TextEditingController();
  final _correoController = new TextEditingController();
  final _claveController = new TextEditingController();
  final _repeatClaveController = new TextEditingController();
  final _inputFieldDateController = new TextEditingController();
  final _inputFieldhastaDateController = new TextEditingController();
  

  final bloc = ReservaBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reservar'),
          backgroundColor: Colors.green,

        ),
        body: _form()
      ),
    );
  }

Widget _form(){
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16,left: 16,top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _textInput(controller: _nombreController,hint: "Nombre",icon: Icons.account_circle),
              Divider(),
              _textInput(controller: _apellidoController,hint: "Número habitaciones",icon: Icons.account_circle),
               Divider(),
              _textInput(controller: _apellidoController,hint: "Número de personas",icon: Icons.account_circle),                  
              Divider(),
              _creaFecha(controller: _inputFieldDateController,hint: "desde",),
              Divider(),
              _creaFecha(controller: _inputFieldDateController,hint: "hasta",),
              Divider(),
              _registrar(),
            ],
          ),
        ),
      ),
    );
}



  //este widget es el correspondiente al nombre
  Widget _textInput({controller: TextEditingController, icon: IconData,hint:String}) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );

  }

  //este widget es el correspondiente a las claves
 


  //este widget es el correspondiente al campo fecha de nacimiento
   
  _creaFecha( {controller: TextEditingController, hint:String}) {

    //final format = DateFormat("yyyy-MM-dd");
    return TextField(
      enableInteractiveSelection: false,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        hintText: hint,
        labelText: hint,
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.grey,
        ),

      ),
      //aqui lo que hacemos es que cuando se haga click en el boton llame al metodo _selectDate para que
      //el datepicker abra el selector de fechas
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      } ,
    );
  }
  //este es el metodo que permite la funcionalidad del selector de fechas
  _selectDate(BuildContext context0) async{

    DateTime picked =  await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1940),
        lastDate: new DateTime.now(),
        locale: Locale('es', 'ES')
    );

    if (picked !=null){
      setState(() {

        _fecha = "${DateFormat('yyyy-MM-dd').format(picked)}";
        _inputFieldDateController.text = _fecha;
      });
    }
  }



 
  Widget _registrar(){

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('Registrarse'),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: (){

        
         registrar();

          

        
      },
    );
  }
  void registrar(){
    reserva = Reserva(idreserva:0,idcliente: 1,idarea:1,
        cantidad: 1, personas: 1,desde: _fecha,hasta: _fecha,comentario:"hola" );

/*  reserva = Reserva(idreserva:0,idcliente: 1,idarea: _apellidoController?.text?.trim(),
        cantidad: _correoController?.text?.toLowerCase()?.trim(), personas: _claveController?.text?.trim()
        ,sexo: _character.toString(),desde: _fecha,hasta: _fecha,comentario: );*/
    print(reserva);
    bloc.reserva(reserva: reserva, context: context);
    Navigator.popAndPushNamed(context, "/reservacompleta");
    // /reservacompleta
  }
  
}



