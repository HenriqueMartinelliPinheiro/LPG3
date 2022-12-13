import 'package:flutter/material.dart';
      
class About extends StatelessWidget{

  String? frase;
  About({Key? key, String? this.frase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.green,
        title: const Text("About"),
      //   leading: IconButton(icon: const Icon(Icons.menu),
      //     onPressed: () {
      //      Navigator.pop(context, true);
      //     },
      // )
        actions: <Widget>[
          TextButton(
            onPressed: () {        
          Navigator.pop(context, true);
            },
          child: const Text('Home',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Text("Este app foi desenvolvido para a disciplina de Linguagem de Programação 3, do Curso  de Bacharelado de Ciência da Computação do Instituto Federal Catarinense Campus Videira, pelo aluno Henrique Martinelli Pinheiro da turma 2021.1. \n\n\n Chuck Norris: \n $frase",
      style: TextStyle(color: Colors.white),
      ),
    );
  }

}