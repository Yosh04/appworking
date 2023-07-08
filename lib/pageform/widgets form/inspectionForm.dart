import 'package:flutter/material.dart';
import '../../models/InspectionFormModel.dart';
import 'package:provider/provider.dart';

class InspectionForm extends StatefulWidget {
  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateCurrently = DateTime.now();

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
    final inspectionForm = Provider.of<InspectionFormModel>(context);

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );

      if (picked != null && picked != inspectionForm.selectedDate) {
        inspectionForm.setSelectedDate(picked);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTimePicker(
              "Hora de inicio",
              inspectionForm.startTime,
              (time) {
                inspectionForm.setStartTime(time);
              },
            ),
            const SizedBox(height: 16),
            _buildTimePicker(
              "Hora de inicio",
              inspectionForm.endTime,
              (time) {
                inspectionForm.setEndTime(time);
              },
            ),
            SizedBox(height: 16),
            _buildDropdown(
              "Embarcación actuante",
              inspectionForm.selectedCountryFlag,
              (value) {
                inspectionForm.setSelectedCountryFlag(value!);
              },
              ["Patrulla propia", "Patrulla externa", "Patrulla conjunta"],
            ),
            SizedBox(height: 16),
            _buildFormField2(
              'Posición',
              inspectionForm.position,
              (value) => inspectionForm.setPosition(value),
            ),
            SizedBox(height: 16),
            _buildFormField2(
              'Embarcación abordada',
              inspectionForm.boardedVessel,
              (value) => inspectionForm.setBoardedVessel(value),
            ),
            SizedBox(height: 16),
            _buildFormField2(
              'Matrícula',
              inspectionForm.matricula,
              (value) => inspectionForm.setMatricula(value),
            ),
            SizedBox(height: 16),
            _buildLargeTextField(
              "Notas adicionales",
              inspectionForm.additionalNotes,
              (value) => inspectionForm.setAdditionalNotes(value),
            ),
            SizedBox(height: 16),
            _buildFormField2(
              'Matrícula',
              inspectionForm.Nzarpe,
              (value) => inspectionForm.setNzarpe(value),
            ),
            SizedBox(height: 16),
            _buildDropdown("Banderas de pais", inspectionForm.selectedShipType,
                (value) {
              inspectionForm.setSelectedShipType(value!);
            }, ["México", "Japón", "Italia", "Costa Rica"]),
            SizedBox(height: 16),
            _buildDropdown(
                "Embarcación actuante", inspectionForm.selectedActingShip,
                (value) {
              inspectionForm.setSelectedActingShip(value!);
            }, ["Madera", "Metal", "Concreto", "Fibra de vidrio"]),
            SizedBox(height: 16),
            _buildFormField2(
              'Certificado Navegabilidad',
              inspectionForm.navigabilityCertificateNumber,
              (value) => inspectionForm.setNavigabilityCertificateNumber(value),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: const Color(0xFF1C207F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.centerLeft,
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 8.0), // Agregar padding a la izquierda
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seleccionar fecha',
                    style: TextStyle(
                      color: Color(0xFF1C207F), // Cambiar color de letras
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

  Widget _buildDropdown(
    String label,
    String? selectedValue,
    void Function(String?) onChanged,
    List<String> options,
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

  Widget _buildLargeTextField(
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: TextFormField(
            minLines: 6,
            maxLines: 10,
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
            ),
            initialValue: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(
    String label,
    TimeOfDay? selectedTime,
    void Function(TimeOfDay) onTimeSelected,
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

  Future<void> _selectTime(
    TimeOfDay? selectedTime,
    void Function(TimeOfDay) onTimeSelected,
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
