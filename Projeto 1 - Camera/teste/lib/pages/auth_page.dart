import "package:flutter/material.dart";
import "package:teste/pages/login_page.dart";
import "package:teste/pages/newUser_page.dart";


class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState()=>_AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin = true;

  @override Widget build(BuildContext context)=>
    isLogin ? Login(onClickedSignUp: toggle,) : SignUp(onClickedSignIn: toggle,);

  void toggle()=> setState(() =>isLogin = !isLogin);
}