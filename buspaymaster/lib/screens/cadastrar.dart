import 'package:flutter/material.dart';

class Cadastrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return  Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,

        ),
        body:Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nome"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){
                    if(text.isEmpty ) return "Nome inválido";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "e-mail"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){
                    if(text.isEmpty || !text.contains("@")) return "E-mail invalido";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "senha"
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty || text.length < 6) return "Senha Inválida";
                  },
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child:  RaisedButton(
                    child: Text("Confirma",
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.lightBlue,
                    onPressed: (){
                      if(_formKey.currentState.validate()){

                      }
                    },
                  ),
                )
              ],
            )
        )
    );

  }
}
