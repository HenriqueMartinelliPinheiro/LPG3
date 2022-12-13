// ignore_for_file: deprecated_member_use, avoid_print
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";

class SignUp extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUp({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
 final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            TextField(
                controller: emailController,
                autofocus: true,
                keyboardType: TextInputType.text,
                style:  TextStyle(color: Colors.white, fontSize: 30),
                decoration: InputDecoration(
                  labelText:"Email",
                  labelStyle: TextStyle(color: Colors.white),
                )
           ),
              const Divider(),
              TextField(
                controller: passwordController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white, fontSize: 30),
                decoration: InputDecoration(
                  labelText:"Senha",
                  labelStyle: TextStyle(color: Colors.white),
                )
              ),
             const Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => {
                    signUp(),
                  },
                  shape:  RoundedRectangleBorder(borderRadius: 
                  BorderRadius.circular(30.0)),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color:Colors.green,
                ),
              ), 
              RichText(text:  TextSpan(
                style: TextStyle(color: Colors.green),
                text: "Já Possui Conta? ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Entre',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.green,
                    )
                  )
                ]
              ))
            ],
         ),
        ),
      )
   );
  }
  Future signUp() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      showDialog<String>(context: context, 
      builder:(BuildContext context)=> AlertDialog(
        title: const Text("Erro", style: const  TextStyle(color: Colors.white)),
        content: const Text("Usuário já cadastrado",
        style: const  TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("Okay",style: const  TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      );
}
  }
}