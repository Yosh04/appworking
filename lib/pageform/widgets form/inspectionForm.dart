import 'package:flutter/material.dart';

class InspectionForm extends StatefulWidget {
  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
    }
  }


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
  TextEditingController NavigabilityCertificateNumberController =
  TextEditingController();

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
          children: [_buildFormField("Cantidad Aprox De Combustible"),
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
            _buildLargeTextField("Notas adicionales",
                additionalNotesController), // Nuevo campo de texto
            SizedBox(height: 16),
            _buildTextField("Número zarpe", NzarpeController),
            SizedBox(height: 16),
            _buildDropdown("Banderas de pais", selectedCountryFlag, (value) {
              setState(() {
                selectedCountryFlag = value;
              });
            }, ["México", "Japón", "Italia", "Costa Rica"]),
            SizedBox(height: 16),
            _buildDropdown("Selccione el tipo embarcacion", selectedShipType,
                    (value) {
                  setState(() {
                    selectedShipType = value;
                  });
                }, ["Madera", "Metal", "Concreto", "Fibra de vidrio"]),
            SizedBox(height: 16),
            _buildTextField(
              "Certificado Navegabilidad",
              NavigabilityCertificateNumberController,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: const Color(0xFF1C207F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(color: Colors.grey, width: 1.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.centerLeft,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0), // Agregar padding a la izquierda
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seleccionar fecha',
                    style: TextStyle(
                      color: const Color(0xFF1C207F), // Cambiar color de letras
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),


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


  Widget _buildTimePicker(String label, TimeOfDay? selectedTime,
      Function(TimeOfDay) onTimeSelected) {
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
            minLines: 6,
            maxLines: 10,
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

  Future<void> _selectTime(
      TimeOfDay? selectedTime,
      Function(TimeOfDay) onTimeSelected,
      ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      onTimeSelected(pickedTime);
    }
  }











}
