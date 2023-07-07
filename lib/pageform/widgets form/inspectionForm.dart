import 'package:flutter/material.dart';

class InspectionForm extends StatefulWidget {
  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  DateTime currentDateSpecial = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

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
            _buildTimePicker("Hora de inicio", startTime, (time) {
              setState(() {
                startTime = time;
              });
            }),
            SizedBox(height: 16),
            _buildTimePicker("Hora de final", endTime, (time) {
              setState(() {
                endTime = time;
              });
            }),
          ],
        ),
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
            borderSide: BorderSide(color: const Color(0xFF1C207F)), // Color del borde
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF1C207F)), // Color del borde cuando está enfocado
          ),
          filled: true, // Relleno activado
          fillColor: Colors.white, // Color de fondo
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(
      String label, TimeOfDay? selectedTime, Function(TimeOfDay) onTimeSelected) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF1C207F), // Color del texto y el borde
        hintColor: const Color(0xFF1C207F), // Color del texto de sugerencia
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF1C207F)), // Color del borde
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF1C207F)), // Color del borde cuando está enfocado
          ),
          filled: true, // Relleno activado
          fillColor: Colors.white, // Color de fondo
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            _selectTime(selectedTime, onTimeSelected);
          },
          child: Container(
            height: 60, // Ajusta la altura según tus necesidades
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      label,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(selectedTime?.format(context) ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(
      TimeOfDay? selectedTime, Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      onTimeSelected(pickedTime);
    }
  }
}
