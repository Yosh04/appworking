import 'package:flutter/material.dart';

class BoatFormModel extends ChangeNotifier {
  String? _cantidadAproximada;
  String? _selectedCountryFlag;
  String? _selectedShipType;
  String? _coordinates;
  String? _position;
  String? _boardedVessel;
  String? _matricula;
  String? _additionalNotes;
  String? _Nzarpe;
  String? _navigabilityCertificateNumber;

  String? get cantidadAproximada => _cantidadAproximada;
  String? get selectedCountryFlag => _selectedCountryFlag;
  String? get selectedShipType => _selectedShipType;
  String? get coordinates => _coordinates;
  String? get position => _position;
  String? get boardedVessel => _boardedVessel;
  String? get matricula => _matricula;
  String? get additionalNotes => _additionalNotes;
  String? get Nzarpe => _Nzarpe;
  String? get navigabilityCertificateNumber => _navigabilityCertificateNumber;

  void setcantidadAproximada(String value) {
    _cantidadAproximada = value;
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
