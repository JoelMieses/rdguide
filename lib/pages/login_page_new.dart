
import 'package:rdguide/bloc/bloc_provider.dart';
import 'package:rdguide/bloc/login_bloc.dart';
import 'package:rdguide/services/authenticator.dart';
import 'package:flutter/material.dart';
import 'recuperar_pass.dart';
import 'package:rdguide/models/usuario.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = authenticator;

  final _emailController =TextEditingController();

  final _claveController =TextEditingController();

  final bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      bloc: bloc,
      child: Stack(
        children:[ Scaffold(

          //backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          body: Container(
            width: _screenSize.width *1,
            height: _screenSize.height *1,

            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/salto.jpg", ),
              fit: BoxFit.fill)
            ),


              child: Padding(

                padding: const EdgeInsets.only(right: 26, left: 26, top:36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[


                    Column(

                        children: <Widget>[
                        Image.asset("assets/logo.png",width: 200,height: 200,),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Colors.grey,),

                            hintText: 'Email',
                            fillColor: Colors.white, filled: true,
                            //labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,

                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextField(
                          obscureText: true,
                          controller: _claveController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            fillColor: Colors.white, filled: true,
                            hintText: "Contraseña",
                            //labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return RecuperarPage();
                              }));
                            },
                            child: Text("¿Olvido su contraseña?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                          )
                        ],
                      ),
                         SizedBox(height: 10,),

                        Container(
                          height: 50,
                          width: double.infinity,
                          child: FlatButton(
                            onPressed: Login,
                            padding: EdgeInsets.all(0),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(22, 124, 236, 1),
                                    Color.fromRGBO(22, 124, 236, 100),
                                    Color.fromRGBO(22, 124, 236, 1),
                                  ],
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                                child: Text("Iniciar sesión",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),

                        SizedBox(height: 16,),
                        Container(
                          height: 30,
                          width: 210,
                          child: FlatButton(
                            onPressed: ()=>auth.IngresarConFacebook(context),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/facebook.png",height: 18,width: 18,),
                                SizedBox(width: 10,),
                                Text("Iniciar con Facebook",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),


                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 30,
                          width: 210,
                          child: FlatButton(
                            onPressed: ()=>auth.IngresarConGoogle(),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/google_logo.png",height: 18,width: 18,),
                                SizedBox(width: 10,),
                                Text("Iniciar con Gmail",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 80,),
                          Text("¿Eres usuario nuevo?",style: TextStyle(fontWeight: FontWeight.bold),),
                          GestureDetector(
                            onTap: (){Null;

                            },
                            child: GestureDetector(
                              child: Text("Registrate",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                              onTap: ()=>{
                                Navigator.pushNamed(context, '/register')
                              },
                            ),
                            )


                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
            loading(bloc),
          error(bloc)
        ],
      ),
    );
  }

  void Login(){
    String correo,clave;
    correo = _emailController.text.trim();
    clave = _claveController.text;

    if(correo.isNotEmpty && clave.isNotEmpty){
      bloc.enviar();
      bloc.login(correo: correo, clave: clave,context: context);
    }

  }

  Widget loading(LoginBloc bloc ) {
    return StreamBuilder(
      stream: bloc.loadingStream,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return Center(
          child: (snapshot.hasData && snapshot.data)? CircularProgressIndicator():null,
        );
      }
    );
  }
  Widget error(LoginBloc bloc ) {
    return StreamBuilder(
        stream: bloc.errorStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Center(
            child: (snapshot.hasData && snapshot.data.isNotEmpty)?
            AlertDialog(

              title: Row(
                children: <Widget>[
                  Icon(Icons.error,color: Colors.red,),
                  Text("Atencion!!"),
                ],
              ),
              content: Text(snapshot.data),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                ),
              ],
            )



                :null,
          );
        }
    );
  }
}

