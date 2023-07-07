import 'package:flutter/material.dart';

class MotorFormularioWidget extends StatelessWidget {
  final int cantidadMotores;

  MotorFormularioWidget({required this.cantidadMotores});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
            cantidadMotores, (index) => buildMotorFormField(index + 1)),
      ),
    );
  }

  Widget buildMotorFormField(int motorNumero) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'M$motorNumero',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildFormField('Tipo Motor'),
          SizedBox(height: 16),
          _buildFormField('Marca Motor'),
          SizedBox(height: 16),
          _buildFormField('Potencia'),
          SizedBox(height: 16),
          _buildFormField('Modelo Motor'),
          SizedBox(height: 16),
          _buildFormField('Serie Motor'),
          SizedBox(height: 16),
          _buildFormField('Combustible'),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildFormField(String label) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF1C207F),
        hintColor: const Color(0xFF1C207F),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF1C207F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF1C207F)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
