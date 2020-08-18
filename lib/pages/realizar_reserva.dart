import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/reserva_bloc.dart';
import 'package:rdguide/models/reserva.dart';
import 'package:rdguide/models/usuario.dart';
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

  final _idreservaController = new TextEditingController();
  final _idclienteController = new TextEditingController();
  final _idareaController = new TextEditingController();
  final _cantidadController = new TextEditingController();
  final _personaController = new TextEditingController();
  //final _desdeController = new TextEditingController();
  //final _hastaController = new TextEditingController();
  final _comentarioontroller = new TextEditingController();
  final bloc = ReservaBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Realizar reserva'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _textInput(controller: _idreservaController,hint: "idreserva",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _idclienteController,hint: "cliente id",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _idareaController,hint: "area",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _cantidadController,hint: "cantidad hab o mesas",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _personaController,hint: "cant personas",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _comentarioontroller,hint: "comentario",icon: Icons.account_circle),
            //_sexo(),            
            Divider(),
            //_creaFecha(context),
         
            _registrar(),
          ],
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
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );

  }



  //este widget es el correspondiente al campo fecha de nacimiento
  /*_creaFecha( BuildContext context) {

    //final format = DateFormat("yyyy-MM-dd");
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
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
  }*/
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
       // _inputFieldDateController.text = _fecha;
      });
    }
  }

  //este widget es el correspondiente al campo boton registro de usuario

  Widget _registrar(){

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('Reservar'),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: (){

        if(_formKey.currentState.validate()){

         registrar();

          

        }
      },
    );
  }
  void registrar(){
    reserva = Reserva(idreserva:0,idcliente: 1 ,idarea:1, cantidad:2, personas: 3, desde:'2020-09-09',hasta:'2020-09-09',comentario:'esto es un comentario'  );

    print(reserva);
    bloc.reserva(reserva: reserva, context: context);
  }
  
}






