import 'package:flutter/material.dart';
import 'package:order_app/Login_Files/RegisterPage.dart';
import 'package:order_app/Login_Files/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true ;
  @override
  Widget build(BuildContext context) =>isLogin
  ? LoginDemo(onClickedSignUP: toggle)
    : RegisterPage(onClickedSignIn:toggle);

  void toggle ()=>setState(()=>isLogin = !isLogin );

  }

