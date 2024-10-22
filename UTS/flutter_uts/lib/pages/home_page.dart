import 'package:flutter/material.dart';

import '../widgets/custom_button.dart'; // Impor widget CustomButton

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final username = args != null ? args as String : 'Guest';

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat datang di aplikasi flutter UTS Pemrograman Mobile,\n $username!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Ke Profile Page',
              onPressed: () {
                Navigator.pushNamed(context, '/profile', arguments: username);
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Ke About Page',
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
