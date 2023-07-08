import 'package:flutter/material.dart';

class PropietarioFormularioWidget extends StatefulWidget {
  @override
  _PropietarioFormularioWidgetState createState() =>
      _PropietarioFormularioWidgetState();
}

class _PropietarioFormularioWidgetState
    extends State<PropietarioFormularioWidget> {
  bool _esPersonaJuridica = false;
  bool _estaAbordo = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: const Text(
              'Propietario',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Persona Jurídica'),
            leading: Radio(
              value: true,
              groupValue: _esPersonaJuridica,
              onChanged: (value) {
                setState(() {
                  _esPersonaJuridica = value as bool;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Persona Física'),
            leading: Radio(
              value: false,
              groupValue: _esPersonaJuridica,
              onChanged: (value) {
                setState(() {
                  _esPersonaJuridica = value as bool;
                });
              },
            ),
          ),
          if (_esPersonaJuridica)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFormField('Empresa o Razón Social'),
                SizedBox(height: 16),
                _buildFormField('Cédula Jurídica'),
              ],
            ),
          if (!_esPersonaJuridica)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFormField('Nombre'),
                SizedBox(height: 16),
                _buildFormField('Identificación'),
                SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('¿Está a bordo?'),
                  value: _estaAbordo,
                  onChanged: (value) {
                    setState(() {
                      _estaAbordo = value!;
                    });
                  },
                ),
                SizedBox(height: 16),
                _buildFormField('Nacionalidad'),
                SizedBox(height: 16),
                _buildFormField('Teléfono'),
              ],
            ),
        ],
      ),
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
