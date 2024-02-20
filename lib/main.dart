import 'package:flutter/material.dart';
import 'package:qtec_tem_mail/screen/home_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HomeScreen(),
    );
  }
}
