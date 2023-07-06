import 'package:flutter/material.dart';
import './widgets form/navigationPrev.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardacostas'),
        backgroundColor: const Color(0xFF1C207F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                20), // Ajusta el valor de acuerdo a tus preferencias
          ),
        ),
      ),
      bottomNavigationBar: NavigationPrev(),
    );
  }
}
