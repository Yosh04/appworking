import 'package:flutter/material.dart';

class InspectionForm extends StatefulWidget {
  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  DateTime currentDateSpecial = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedActingShip;
  String? selectedCountryFlag;
  String? selectedShipType;
  TextEditingController coordinatesController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController boardedVesselController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();
  TextEditingController NzarpeController = TextEditingController();
  TextEditingController NavigabilityCertificateNumberController = TextEditingController();
  TimeOfDay? endNavegavilityCertificate;







  @override
  void dispose() {
    coordinatesController.dispose();
    positionController.dispose();
    boardedVesselController.dispose();
    matriculaController.dispose();
    additionalNotesController.dispose();
    NzarpeController.dispose();
    NavigabilityCertificateNumberController.dispose();

    super.dispose();
  }

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
            SizedBox(height: 16),
            _buildDropdown("Embarcación actuante", selectedActingShip, (value) {
              setState(() {
                selectedActingShip = value;
              });
            }, ["Patrulla propia", "Patrulla externa", "Patrulla conjunta"]),
            SizedBox(height: 16),
            _buildTextField("Posición", positionController),
            SizedBox(height: 16),
            _buildTextField("Embarcación abordada", boardedVesselController),
            SizedBox(height: 16),
            _buildTextField("Matrícula", matriculaController),
            SizedBox(height: 16),
            _buildLargeTextField("Notas adicionales", additionalNotesController), // Nuevo campo de texto
            SizedBox(height: 16),
            _buildTextField("Número zarpe", NzarpeController),
            SizedBox(height: 16),
            _buildDropdown("Banderas de pais", selectedCountryFlag, (value) {
              setState(() {
                selectedCountryFlag = value;
              });
            }, ["México", "Japón", "Italia","Costa Rica"]),
            SizedBox(height: 16),
            _buildDropdown("Selccione el tipo embarcacion", selectedShipType, (value) {
              setState(() {
                selectedShipType = value;
              });
            }, ["Madera", "Metal", "Concreto","Fibra de vidrio"]),
            SizedBox(height: 16),
            _buildTextField("Certificado Navegabilidad", NavigabilityCertificateNumberController),
            SizedBox(height: 16),
            _buildTimePicker("Fecha de vencimiento Certificado Navegabilidad", startTime, (time) {
              setState(() {
                startTime = time;
              });
            }),
            SizedBox(height: 16),
            _buildDateWithYearPicker("Fecha de vencimiento Certificado Navegabilidad", currentDateSpecial, (date) {
              setState(() {
                currentDateSpecial = date;
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
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDateWithYearPicker(
      String label,
      DateTime? selectedDate,
      Function(DateTime) onDateSelected,
      ) {
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
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            _selectDateWithYear(selectedDate, onDateSelected);
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
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
                Text(selectedDate?.toString() ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateWithYear(
      DateTime? selectedDate,
      Function(DateTime) onDateSelected,
      ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale("es", "MX"), // Configura el idioma y la región según tus necesidades
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color(0xFF1C207F),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      onDateSelected(pickedDate);
    }
  }


  Widget _buildTimePicker(
      String label, TimeOfDay? selectedTime, Function(TimeOfDay) onTimeSelected) {
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
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            _selectTime(selectedTime, onTimeSelected);
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
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

  Widget _buildDropdown(String label, String? selectedValue, Function(String?) onChanged, List<String> options) {
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

  Widget _buildLargeTextField(String label, TextEditingController controller) {
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
          child: TextFormField(
            controller: controller,
            minLines: 6, // Tamaño mayor de 200 de alto (6 líneas)
            maxLines: 10, // Puedes ajustar este número según tus necesidades
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
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
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(
      DateTime? selectedDate, Function(DateTime) onDateSelected) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      onDateSelected(pickedDate);
    }
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
