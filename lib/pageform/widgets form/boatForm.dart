import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            SizedBox(height: 16),
            _buildNumericFormField("Cantidad de Motores"),
            Divider(),
            _buildFormField("Eslora"),
            SizedBox(height: 16),
            _buildFormField("Manga"),
            SizedBox(height: 16),
            _buildFormField("Puntal"),
            SizedBox(height: 16),
            _buildFormField("Calado"),
            SizedBox(height: 16),
            _buildFormField("Tonelaje Bruto"),
            SizedBox(height: 16),
            _buildFormField("Tonelaje Neto"),
            Divider(),
            _buildFormField("Equipo De Navegacion"),
            SizedBox(height: 16),
            _buildNumericFormField("Tripulacion"),
            SizedBox(height: 16),
            _buildNumericFormField("Pasajeros"),
            Divider(),
            _buildFormField("Actividad Al Momento Del Abordaje"),
            Divider(),
            _buildFormField("Bitacora De La Embarcación"),
          ],
        ),
      ),
    );
  }

  Widget _buildNumericFormField(String label) {
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
        keyboardType: TextInputType.number, // Configura el teclado numérico
        decoration: InputDecoration(
          labelText: label,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter
              .digitsOnly // Limita la entrada solo a números
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

class ToggleBox extends StatefulWidget {
  @override
  _ToggleBoxState createState() => _ToggleBoxState();
}

class _ToggleBoxState extends State<ToggleBox> {
  String selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            "Material:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<String>(
          title: const Text("Fibra de vidrio"),
          value: "Fibra de vidrio",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text("Madera"),
          value: "Madera",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text("Metal"),
          value: "Metal",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text("Cemento"),
          value: "Cemento",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
      ],
    );
  }
}
