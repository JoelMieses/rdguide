import 'package:flutter/material.dart';
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/registro_bloc.dart';
import 'package:rdguide/models/usuario.dart';
import 'package:intl/intl.dart';


class RegistroUsuarioPage extends StatefulWidget {
  @override
  _RegistroUsuarioPageState createState() => _RegistroUsuarioPageState();
}

Usuario usuario = new Usuario();
String claveError;


final _formKey = GlobalKey<FormState>();

class _RegistroUsuarioPageState extends State<RegistroUsuarioPage> {

  String _fecha = '';

  final _nombreController = new TextEditingController();
  final _apellidoController = new TextEditingController();
  final _correoController = new TextEditingController();
  final _claveController = new TextEditingController();
  final _repeatClaveController = new TextEditingController();
  final _inputFieldDateController = new TextEditingController();

  final bloc = RegistroBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrar Usuario'),
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
            _textInput(controller: _nombreController,hint: "Nombre",icon: Icons.account_circle),
            Divider(),
            _textInput(controller: _apellidoController,hint: "Apellido",icon: Icons.account_circle),
            //Divider(),
            //_sexo(),
            MyStatefulWidget(),
            Divider(),
            _creaFecha(context),
            Divider(),
            _email(),
            Divider(),
            _claveInput(controller: _claveController,hint: "Contraseña"),
            Divider(),
            _claveInput(controller: _repeatClaveController,hint: "Confirmar Contraseña"),
            Divider(),
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

  //este widget es el correspondiente a las claves
  Widget _claveInput({controller: TextEditingController, hint:String}) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      onChanged: (value){
        setState(() {
          usuario.clave = value;
        });
      },
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
          Icons.lock,
          color: Colors.grey,
        ),
      ),
    );

  }


  //este widget es el correspondiente al campo fecha de nacimiento
  _creaFecha( BuildContext context) {

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


  //este widget es el correspondiente al Correo electronico
  _email() {

    return TextFormField(
      controller: _correoController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value.isEmpty){
          return "Este campo no puede estar vacio";
        }return null;
      },
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "xxxxxx@ejemplo.com",
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
      ),
    );

  }

  //este widget es el correspondiente al campo crear contraseña
//  Widget _crearPass( ) {
//
//    return TextField(
//      obscureText: true,
//      decoration: InputDecoration(
//        border: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(20.0)
//        ),
//        hintText: 'Contraseña',
//        //labelText: 'Contraseña',
//        prefixIcon: Icon(
//          Icons.lock,
//          color: Colors.grey,
//        ),
//
//      ),
//    );
//  }

  //este widget es el correspondiente al campo confirmar contraseña
//  Widget _confirmarPass( ) {
//
//    return TextField(
//      obscureText: true,
//      decoration: InputDecoration(
//        border: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(20.0)
//        ),
//        hintText: 'Confirmar Contraseña',
//        //labelText: 'Confirmar Contraseña',
//        prefixIcon: Icon(
//          Icons.lock,
//          color: Colors.grey,
//        ),
//
//      ),
//    );
//  }

  //este widget es el correspondiente al campo boton registro de usuario

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

        if(_formKey.currentState.validate()){

         registrar();

          if(validatePassword()){

          }else{
             SnackBar(content: Text("Contraseña no coinciden"),);
          }

        }
      },
    );
  }
  void registrar(){
    usuario = Usuario(id:0,nombre: _nombreController?.text?.trim(),apellido: _apellidoController?.text?.trim(),
        email: _correoController?.text?.toLowerCase()?.trim(), clave: _claveController?.text?.trim()
        ,sexo: _character.toString(),fechanac: _fecha);

    print(usuario);
    bloc.registro(usuario: usuario, context: context);
  }
  bool validatePassword(){
    return (_claveController?.text == _repeatClaveController.text);
  }
}


class RadioButton extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(

        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}
String _character = "M";


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Sexo: ', style: TextStyle(fontSize: 18),),
        ListTile(
          title: const Text('Masculino',),
          leading: Radio(
            value: "M",
            groupValue: _character,
            onChanged: (String value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Femenino'),
          leading: Radio(
            value: "F",
            groupValue: _character,
            onChanged: (String value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}