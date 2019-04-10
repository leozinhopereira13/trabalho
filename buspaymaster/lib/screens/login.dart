import 'package:buspay/screens/admin.dart';
import 'package:buspay/screens/cadastrar.dart';
import 'package:buspay/screens/esqueci.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'file_utils.dart';
import 'dart:io';
import 'dart:convert';



class Login extends StatefulWidget {


  @override

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   // variavel de checkbox	
  bool valeuCheckbox =  false;
  String teste="" ;


  //Declaração dos Controllers
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //Texto de Validação
  String _infoText = "";

  String username = "";

  //Key usado para Validação do formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();





  //Conexao a nossa API
  Future _login() async {
			if(valeuCheckbox){
				
				FileUtils().writeCounter(loginController.text);
			}
    //url de teste, retornando um json
    //login: jorge
    //senha:123

    final response = await http.post(
      "http://taturei.5gbfree.com/api/controllers/login.php",
      body: {
        "username": loginController.text,
        "userpass": passController.text,
      },
    );

    //Variavel de retorno do Json
    var datauser = convert.jsonDecode(response.body);



      if (datauser['resposta'] == 'false') {
        setState(() {
          _infoText = "Falha ao Logar";
        });

      } else {
          if (datauser['resposta'] == 'true') {

            Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=> Admin(datauser['nome'],datauser['email']))
            );
          }
        }
    }

// logica para marcar e desmarcar o Checkbox
bool onChanged(bool value){
     setState((){
        valeuCheckbox = !value;
	
     });	
    return null ;
 }
// esta verificando se ja tem algun email salvo 
 void initState(){
	FileUtils().readCounter().then((value){
		setState((){
			teste=value;
			loginController=TextEditingController(text: value);	
		});	
		
	});

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENTRAR"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          FlatButton(
            child: Text("Criar Conta",
              style: TextStyle(
                fontSize: 15.0
              ),
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=> Cadastrar())
              );;
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.directions_bus,
                    size: 100.0,
                    color: Colors.lightBlue,
                  ),
                  Text(
                    "Bus Pay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.lightBlue),
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                      controller: loginController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu E-mail";
                        } else {
                          if (!value.contains("@")) {
                            return "Digite um E-mail válido";
                          }
                        }
                      }),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.vpn_key, color: Colors.lightBlue),
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                      controller: passController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua senha";
                        } else {
                          if (value.length < 6) {
                            return "Digita uma senha com mais de 6 caracteres";
                          }
                        }
                      }),
		  Row(children: <Widget>[
	             Checkbox(value: valeuCheckbox , onChanged: (bool value){onChanged(valeuCheckbox);}),
		        Text("Salvar E-mail"),	

		
		]),
		/*
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=> Esqueci())
                        );
                      },
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
		*/
		

                  Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 0),
                      child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _infoText = "";
                                _login();
                              }
                            },
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            color: Colors.lightBlue,
                          )
                      )
                  ),


		Align(
                    //alignment: Alignment.centerLeft,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=> Esqueci())
                        );
                      },
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),


                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                  ),
                ],
              ))),
    );
  }
}
