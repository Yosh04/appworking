import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/BoatFormModel.dart';
import 'motorForm.dart';
import '../formPage.dart';

class FormularioEmbarcacionWidget extends StatefulWidget {
  @override
  _FormularioEmbarcacionWidgetState createState() =>
      _FormularioEmbarcacionWidgetState();
}

class _FormularioEmbarcacionWidgetState
    extends State<FormularioEmbarcacionWidget> {
  int cantidadMotores = 0;
  int cantidadtripulacion = 0;
  int cantidadpasajeros = 0;
  String? selectedShipType;
  @override
  Widget build(BuildContext context) {
    final boatForm = Provider.of<BoatFormModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFormField2(
                "Cantidad Aprox De Combustible",
                boatForm.cantidadAproximada,
                (value) => boatForm.setcantidadAproximada(value)),
            SizedBox(height: 16),
            _buildFormField("Capacid. Tanq. Combustible"),
            SizedBox(height: 16),
            _buildFormField("Capacidad Tanq. Carga"),
            SizedBox(height: 16),
            _buildFormField("Capacidad Tanq. Agua"),
            SizedBox(height: 16),
            _buildNumericFormFieldMotors("Cantidad de Motores"),
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
            _buildDropdown("Selccione material del barco", selectedShipType,
                (value) {
              setState(() {
                selectedShipType = value;
              });
            }, ["Madera", "Metal", "Concreto", "Fibra de vidrio"]),
            SizedBox(height: 16),
            _buildFormField("Color de Casco"),
            SizedBox(height: 16),
            _buildFormField("Características Generales De La Embarcacion"),
            Divider(),
            _buildNumericFormFieldtripulacion("Tripulacion"),
            SizedBox(height: 16),
            _buildNumericFormFieldPasajeros("Pasajeros"),
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

  Widget _buildNumericFormFieldMotors(String label) {
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

  Widget _buildNumericFormFieldtripulacion(String label) {
    TextEditingController ntripulacion = TextEditingController(text: "");
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
        controller: ntripulacion,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormPage(ntripulacion.text)));
          });
        },
      ),
    );
  }

  Widget _buildNumericFormFieldPasajeros(String label) {
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
          setState(() {});
        },
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

  Widget _buildFormField2(
    String label,
    String? value,
    void Function(String) onChanged,
  ) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF1C207F),
        hintColor: const Color(0xFF1C207F),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1C207F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1C207F)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        initialValue: value,
        onChanged: onChanged,
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
