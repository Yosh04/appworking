import 'package:flutter/material.dart';
import './boatForm.dart';

late int Ntripulacion = 0;
late int NPasajeros = 0;

void getNumTripulacion(int b) {
  Ntripulacion = b;
}

void getNumPasajeros(int a) {
  Ntripulacion = a;
}

class TripulacionFormularioWidget extends StatefulWidget {
  final int cantidadTripulacion = NPasajeros + Ntripulacion;

  @override
  _TripulacionFormularioWidgetState createState() =>
      _TripulacionFormularioWidgetState();
}

class _TripulacionFormularioWidgetState
    extends State<TripulacionFormularioWidget> {
  String? selectedShipType;
  List<bool> _propietarioList = [];

  @override
  void initState() {
    super.initState();
    _initializePropietarioList();
  }

  void _initializePropietarioList() {
    _propietarioList = List.generate(
      widget.cantidadTripulacion,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            widget.cantidadTripulacion,
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
        _buildFormField('Carnet de Pesca'),
        SizedBox(height: 16),
        _buildFormField('Número de Teléfono'),
        SizedBox(height: 16),
        _buildDropdown("Clasificacion", selectedShipType, (value) {
          setState(() {
            selectedShipType = value;
          });
        }, ["Pasajero", "Tripulante", "Capitan"]),
        Divider(),
        CheckboxListTile(
          title: const Text('Propietario'),
          value: _propietarioList[tripulanteNumero - 1],
          onChanged: (value) {
            setState(() {
              _propietarioList = List.generate(
                widget.cantidadTripulacion,
                (_) => false,
              );
              _propietarioList[tripulanteNumero - 1] = value!;
            });
          },
        ),
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

  Widget _buildDropdown(String label, String? selectedValue,
      Function(String?) onChanged, List<String> options) {
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
            ),
            value: selectedValue,
            onChanged: onChanged,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
