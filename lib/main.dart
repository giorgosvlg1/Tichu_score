import 'package:flutter/material.dart';
import 'package:tichu_score/views/pages/welcome_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }
}
