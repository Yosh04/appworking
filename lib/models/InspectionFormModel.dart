import 'package:flutter/material.dart';

  class InspectionFormModel extends ChangeNotifier {
    DateTime _selectedDate = DateTime.now();
    DateTime _selectedDateCurrently = DateTime.now();
    TimeOfDay? _startTime;
    TimeOfDay? _endTime;
    String? _selectedActingShip;
    String? _selectedCountryFlag;
    String? _selectedShipType;
    String? _coordinates;
    String? _position;
    String? _boardedVessel;
    String? _matricula;
    String? _additionalNotes;
    String? _Nzarpe;
    String? _navigabilityCertificateNumber;

    DateTime get selectedDate => _selectedDate;
    DateTime get selectedDateCurrently => _selectedDateCurrently;
    TimeOfDay? get startTime => _startTime;
    TimeOfDay? get endTime => _endTime;
    String? get selectedActingShip => _selectedActingShip;
    String? get selectedCountryFlag => _selectedCountryFlag;
    String? get selectedShipType => _selectedShipType;
    String? get coordinates => _coordinates;
    String? get position => _position;
    String? get boardedVessel => _boardedVessel;
    String? get matricula => _matricula;
    String? get additionalNotes => _additionalNotes;
    String? get Nzarpe => _Nzarpe;
    String? get navigabilityCertificateNumber => _navigabilityCertificateNumber;

    Map<String, dynamic> getAllValues() {
      return {
        'selectedDate': _selectedDate,
        'selectedDateCurrently': _selectedDateCurrently,
        'startTime': _startTime,
        'endTime': _endTime,
        'selectedActingShip': _selectedActingShip,
        'selectedCountryFlag': _selectedCountryFlag,
        'selectedShipType': _selectedShipType,
        'coordinates': _coordinates,
        'position': _position,
        'boardedVessel': _boardedVessel,
        'matricula': _matricula,
        'additionalNotes': _additionalNotes,
        'Nzarpe': _Nzarpe,
        'navigabilityCertificateNumber': _navigabilityCertificateNumber,
      };
    }

    List<List<String>> getToList() {
      return [
        [_selectedDate.toString()],
        [_selectedDateCurrently.toString()],
        [_startTime.toString()],
        [_endTime.toString()],
        [_selectedActingShip.toString()],
        [_selectedCountryFlag.toString()],
        [_selectedShipType.toString()],
        [_coordinates.toString()],
        [_position.toString()],
        [_boardedVessel.toString()],
        [_matricula.toString()],
        [_additionalNotes.toString()],
        [_Nzarpe.toString()],
        [_navigabilityCertificateNumber.toString()],
      ];
    }

    List<List<String>> getToListIncident() {
      return [
        ["DC1"],
        ["DC2"],
        ["DC3"],
        ["SAR1"],
        ["SAR2"],
        ["SA4"],
        ["SP1"],

      ];
    }




    void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedDateCurrently(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setStartTime(TimeOfDay time) {
    _startTime = time;
    notifyListeners();
  }

  void setEndTime(TimeOfDay time) {
    _endTime = time;
    notifyListeners();
  }

  void setSelectedActingShip(String value) {
    _selectedActingShip = value;
    notifyListeners();
  }

  void setSelectedCountryFlag(String value) {
    _selectedCountryFlag = value;
    notifyListeners();
  }

  void setSelectedShipType(String value) {
    _selectedShipType = value;
    notifyListeners();
  }

  void setCoordinates(String value) {
    _coordinates = value;
    notifyListeners();
  }

  void setPosition(String value) {
    _position = value;
    notifyListeners();
  }

  void setBoardedVessel(String value) {
    _boardedVessel = value;
    notifyListeners();
  }

  void setMatricula(String value) {
    _matricula = value;
    notifyListeners();
  }

  void setAdditionalNotes(String value) {
    _additionalNotes = value;
    notifyListeners();
  }

  void setNzarpe(String value) {
    _Nzarpe = value;
    notifyListeners();
  }

  void setNavigabilityCertificateNumber(String value) {
    _navigabilityCertificateNumber = value;
    notifyListeners();
  }
}
