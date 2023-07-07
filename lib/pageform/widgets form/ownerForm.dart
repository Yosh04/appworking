import 'package:flutter/material.dart';

class TripulacionFormularioWidget extends StatelessWidget {
  final int cantidadTripulacion;

  TripulacionFormularioWidget({required this.cantidadTripulacion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            cantidadTripulacion,
            (index) => _buildTripulanteFormField(index + 1),
          ),
        ),
      ),
    );
  }

  Widget _buildTripulanteFormField(int tripulanteNumero) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tripulante $tripulanteNumero',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildFormField('Nombre'),
        SizedBox(height: 16),
        _buildFormField('Identificación'),
        SizedBox(height: 16),
        _buildFormField('Carnet de Pesca/Número de Teléfono'),
        SizedBox(height: 16),
        _buildFormField('Clasificación'),
        Divider(),
      ],
    );
  }

  Widget _buildFormField(String label) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF1C207F), // Color del texto y el borde
        hintColor: const Color(0xFF1C207F), // Color del texto de sugerencia
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF1C207F)), // Color del borde
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(
                    0xFF1C207F)), // Color del borde cuando está enfocado
          ),
          filled: true, // Relleno activado
          fillColor: Colors.white, // Color de fondo
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
