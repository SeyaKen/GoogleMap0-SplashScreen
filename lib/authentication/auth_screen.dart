import 'package:flutter/material.dart';
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
          color: const Color(0xffe83434),
        ),
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'images/demaekan.jpg',
            fit: BoxFit.fill,
          ),
        ),
        centerTitle: true,
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              child: Text(
                'ログイン',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              child: Text(
                '新規登録',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )
              ),
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
            RegisterScreen(),
            RegisterScreen(),
          ]
        )
      ),
      ),
    );
  }
}
