import 'package:flutter/material.dart';

class FormularioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFormField("Cantidad Aprox De Combustible"),
            SizedBox(height: 16),
            _buildFormField("Capacid. Tanq. Combustible"),
            SizedBox(height: 16),
            _buildFormField("Capacidad Tanq. Carga"),
            SizedBox(height: 16),
            _buildFormField("Capacidad Tanq. Agua"),
            Divider(),
            _buildFormField("Eslora"),
            SizedBox(height: 16),
            _buildFormField("Manga"),
            SizedBox(height: 16),
            _buildFormField("Puntal"),
            SizedBox(height: 16),
            _buildFormField("Calado"),
            SizedBox(height: 16),
            _buildFormField("Trb"),
            SizedBox(height: 16),
            _buildFormField("Trn"),
            Divider(),
            _buildFormField("Equipo De Navegacion"),
            SizedBox(height: 16),
            _buildFormField("Características Generales De La Embarcacion"),
            SizedBox(height: 16),
            _buildFormField("Material Y Color Casco"),
            Divider(),
            _buildFormField("Tripulacion"),
            SizedBox(height: 16),
            _buildFormField("Pasajeros"),
            Divider(),
            _buildFormField("Actividad Al Momento Del Abordaje"),
            Divider(),
            _buildFormField("Bitacora De La Embarcación"),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
