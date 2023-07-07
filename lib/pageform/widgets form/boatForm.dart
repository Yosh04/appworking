import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'motorForm.dart';
import 'package:flutter/material.dart';

class FormularioEmbarcacionWidget extends StatefulWidget {
  @override
  _FormularioEmbarcacionWidgetState createState() =>
      _FormularioEmbarcacionWidgetState();
}

class _FormularioEmbarcacionWidgetState
    extends State<FormularioEmbarcacionWidget> {
  int cantidadMotores = 0;

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
            ToggleBox(),
            SizedBox(height: 16),
            _buildFormField("Color de Casco"),
            SizedBox(height: 16),
            _buildFormField("Características Generales De La Embarcacion"),
            Divider(),
            _buildNumericFormField("Tripulacion"),
            SizedBox(height: 16),
            _buildNumericFormField("Pasajeros"),
            Divider(),
            _buildFormField("Actividad Al Momento Del Abordaje"),
            Divider(),
            _buildFormField("Bitacora De La Embarcación"),
            SingleChildScrollView(
              child: MotorFormularioWidget(cantidadMotores: cantidadMotores),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumericFormField(String label) {
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
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          setState(() {
            cantidadMotores = int.tryParse(value) ?? 0;
          });
        },
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
