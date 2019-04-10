import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override

  Admin(this.nome,this.email);
  final nome;
  final email;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Área do Usuário"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],

        ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey[500],
                    radius: 30.0,
                    child: Icon(
                        Icons.person,
                            size: 60.0,
                      color: Colors.white,
                    ),
                  ) ,
                  accountName: Text(nome),
                  accountEmail: Text(email)),
                  
            ],
          ),
      ),
      body: Container(),
      );

  }
}
