import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/authentication/login.dart';
import 'package:foodpand_sellers_app/authentication/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // BottomNavigatorの上版みたいなやつ
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
        automaticallyImplyLeading: false,
        // AppBarの背景
        flexibleSpace: Container(
          color: Colors.red,
        ),
        title: const Text(
          'iFood',
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
            fontFamily: 'Lobster',
          )),
        centerTitle: true,
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              text: 'Login',
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              text: 'Register ',
            ),
          ],
          indicatorColor: Colors.white38,
          indicatorWeight: 6,
        )
      ),
      body: Container(
        color: Colors.white,
        child: const TabBarView(
          children: [
            LoginScreen(),
            RegisterScreen(),
          ]
        )
      ),
      ),
    );
  }
}
