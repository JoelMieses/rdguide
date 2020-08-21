import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/reserva_bloc.dart';
import 'package:rdguide/models/areas.dart';
import 'package:rdguide/models/reserva.dart';
import 'package:intl/intl.dart';
import 'package:rdguide/services/shared_preferences.dart';


class RealizarReservaPage extends StatefulWidget {
  @override
  _RealizarReservaPageState createState() => _RealizarReservaPageState();
}

Reserva reserva = new Reserva();
String claveError;


final _formKey = GlobalKey<FormState>();

class _RealizarReservaPageState extends State<RealizarReservaPage> {



  String _fechaDesde = '';
  String _fechaHasta = '';

  final _cantHabitacionesController = new TextEditingController();
  final _nombreController = new TextEditingController();
  final _cantPersonasController = new TextEditingController();
  final _inputFieldDateController = new TextEditingController();
  final _inputFieldhastaDateController = new TextEditingController();
  final _comentarioController = new TextEditingController();
   Area area = new Area();
  String nombre = null;
  int userId = 0;

  final bloc = ReservaBloc();

  @override
  Widget build(BuildContext context) {
   area = ModalRoute.of(context).settings.arguments;
   _nombreController.text = nombre;
   getUsuario();
    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Reservar'),
          backgroundColor: Colors.green,

        ),
        body: _form()
      ),
    );
  }
void getUsuario()async{
    final user = await sharedPreferences.getUsuario();
    if(user.nombre.isNotEmpty && user.apellido.isNotEmpty){
      setState(() {
        nombre = "${user.nombre} ${user.apellido}";
        userId = user.id;
      });
    }
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
              Text("${nombre} Gracias por reservar con nosotros \n Favor complete los siguientes datos:\n",textAlign: TextAlign.center,),
              _textInput(controller: _nombreController,hint: "Nombre",icon: Icons.account_circle),
              Divider(),              
              _textInput(controller: _cantHabitacionesController,hint: "Número habitaciones",icon: Icons.list),
               Divider(),
              _textInput(controller: _cantPersonasController,hint: "Número de personas",icon: Icons.people),
              Divider(),
              _desdeFecha(),
              Divider(),
              _hastaFecha(),
              Divider(),
              _comentario(controller: _comentarioController,hint: "Comentario",icon: Icons.comment),
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
      keyboardType: TextInputType.number,
      validator: (value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      },
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

  Widget _comentario({controller: TextEditingController, icon: IconData,hint:String}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      validator: (value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      },
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
   
  _desdeFecha() {

    //final format = DateFormat("yyyy-MM-dd");
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      validator:(value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      } ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
            
        ),
        hintText: "Desde",
        labelText: "Desde",
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.grey,
          
        ),

      ),
      
      //aqui lo que hacemos es que cuando se haga click en el boton llame al metodo _selectDate para que
      //el datepicker abra el selector de fechas
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDesdeDate(context);

      } ,
    );
  }
  _hastaFecha() {

    //final format = DateFormat("yyyy-MM-dd");
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFieldhastaDateController,
       validator:(value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      } ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        hintText: "Hasta",
        labelText: "Hasta",
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.grey,
        ),

      ),
      //aqui lo que hacemos es que cuando se haga click en el boton llame al metodo _selectDate para que
      //el datepicker abra el selector de fechas
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectHastaDate(context);

      } ,
    );
  }
  //este es el metodo que permite la funcionalidad del selector de fechas
  _selectDesdeDate(BuildContext context) async{

    DateTime picked =  await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime.now().add(Duration(days: 365)),
        locale: Locale('es', 'ES')
    );

    if (picked !=null){
      setState(() {

        _fechaDesde = "${DateFormat('yyyy-MM-dd').format(picked)}";
        _inputFieldDateController.text = _fechaDesde;
      });
    }
  }

  //este es el metodo que permite la funcionalidad del selector de fechas
  _selectHastaDate(BuildContext context) async{

    DateTime picked =  await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime.now().add(Duration(days: 365)),
        locale: Locale('es', 'ES')
    );

    if (picked !=null){
      setState(() {

        _fechaHasta = "${DateFormat('yyyy-MM-dd').format(picked)}";
        _inputFieldhastaDateController.text = _fechaHasta;
      });
    }
  }



 
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
    reserva = Reserva(idreserva:0,idcliente: userId,idarea:int.parse(area.id),
        cantidad: int.parse(_cantHabitacionesController?.text?.trim()),
        personas:int.parse(_cantPersonasController?.text?.trim()),desde: _fechaDesde,hasta: _fechaHasta,comentario:_comentarioController?.text?.trim() );

/*  reserva = Reserva(idreserva:0,idcliente: 1,idarea: _apellidoController?.text?.trim(),
        cantidad: _correoController?.text?.toLowerCase()?.trim(), personas: _claveController?.text?.trim()
        ,sexo: _character.toString(),desde: _fecha,hasta: _fecha,comentario: );*/
    print(reserva);
    bloc.reserva(reserva: reserva, context: context);
   // Navigator.popAndPushNamed(context, "/reservacompleta");
    // /reservacompleta
  }
  
}



