import 'package:flutter/material.dart';

class IncidentsForm extends StatefulWidget {
  @override
  _IncidentsFormState createState() => _IncidentsFormState();
}

class _IncidentsFormState extends State<IncidentsForm> {
  bool _isExpanded1 = false;

  // Var for the state of checkbox commonCrimes.
  bool _isDC1Checked = false;
  bool _isDC2Checked = false;
  bool _isDC3Checked = false;

  // Var for the state of checkbox Narcotics.
  bool _isN1Checked = false;
  bool _isN2Checked = false;
  bool _isN3Checked = false;
  bool _isN4Checked = false;
  bool _isN5Checked = false;
  bool _isN6Checked = false;

  // Var for the state of checkbox Natural Resources.
  bool _isRN1Checked = false;
  bool _isRN2Checked = false;
  bool _isRN3Checked = false;
  bool _isRN4Checked = false;
  bool _isRN5Checked = false;
  bool _isRN6Checked = false;
  bool _isRN7Checked = false;
  bool _isRN8Checked = false;
  bool _isRN9Checked = false;
  bool _isRN10Checked = false;
  bool _isRN11Checked = false;
  bool _isRN12_1Checked = false;
  bool _isRN12_2Checked = false;
  bool _isRN12_3Checked = false;
  bool _isRN12_4Checked = false;
  bool _isRN12_5Checked = false;
  bool _isRN12_6Checked = false;

  // Var for the state of checkbox Search and Rescue.
  bool _isSAR1Checked = false;
  bool _isSAR2Checked = false;
  bool _isSAR3Checked = false;
  bool _isSAR4Checked = false;

  // Var for the state of checkbox maritime traffic
  bool _isTM1Checked = false;
  bool _isTM2Checked = false;
  bool _isTM2_1Checked = false;
  bool _isTM2_2Checked = false;
  bool _isTM2_3Checked = false;
  bool _isTM2_4Checked = false;
  bool _isTM3Checked = false;
  bool _isTM3_1Checked = false;
  bool _isTM3_2Checked = false;
  bool _isTM3_3Checked = false;
  bool _isTM3_4Checked = false;
  bool _isTM3_5Checked = false;
  bool _isTM4Checked = false;
  bool _isTM4_1Checked = false;
  bool _isTM5Checked = false;
  bool _isTM6Checked = false;
  // Var for the state of checkbox Beach security.

  bool _isTSP1Checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            commonCrime(),
            const SizedBox(height: 10.0),
            narcotics(),
            const SizedBox(height: 10.0),
            naturalResources(),
            const SizedBox(height: 10.0),
            searchRescue(),
            const SizedBox(height: 10.0),
            maritimeTraffic(),
            const SizedBox(height: 10.0),
            beachSecurity(),
          ],
        ),
      ),
    );
  }

  Widget commonCrime() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Delito Común',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('DC1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Piratería (Asalto a una Embarcación)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isDC1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isDC1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('DC2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Transporte de ilegales'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isDC2Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isDC2Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('DC3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Robos de productos, Embarcación , motores'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isDC3Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isDC3Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget narcotics() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Narcotráfico',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Embarcación encallada que  transporta droga'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Intercepción de una embarcación con droga'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN2Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN2Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación abordada y aparece droga'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN3Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN3Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Abordaje a semi-Sumergible'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN4Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN4Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N5'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Trasiego en combustible'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN5Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN5Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('N6'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Trasiego de Armas'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isN6Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isN6Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget naturalResources() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Recursos Naturales',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Invasión de una zona protegida'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Invasión de la zona marítimo terrestre'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN2Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN2Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Tala de bosque costero y humedales'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN3Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN3Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('DET Inspecciones a barcos camaroneros'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN4Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN4Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN5'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Levantamiento de artes de pesca (Trasmallos, líneas, rastras, etc.)	'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN5Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN5Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN6'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Caza de tortugas y extracción de huevos, extracción de nidos'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN6Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN6Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN7'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Cacería Ilegal (EXCEPTO LO RELACIONADO A TORTUGAS MARINAS)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN7Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN7Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN8'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Decomiso de fauna silvestre'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN8Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN8Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN9'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Encallamiento de ballenas y delfines'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN9Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN9Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN10'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Contaminación'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN10Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN10Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN11'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Embarcación SIN Licencia de Pesca (PESCA ILEGAL)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN11Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN11Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN 12-1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Pesca Ilegal, artes de pesca prohibidas'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN12_1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN12_1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN 12-2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Pesca Ilegal, áreas protegidas'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN12_2Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN12_2Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN 12-3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Pesca Ilegal, durante veda'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN12_3Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN12_3Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN 12-4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Pesca Ilegal, especies protegidas'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN12_4Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN12_4Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('RN 12-6'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Canon de licencia de pesca vencido'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isRN12_6Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isRN12_6Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchRescue() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Búsqueda y Rescate',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SAR1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Búsqueda de Embarcación desaparecida'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isSAR1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isSAR1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SAR2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Búsqueda de persona desaparecida'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isSAR2Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isSAR2Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SAR3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Búsqueda de un cuerpo'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isSAR3Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isSAR3Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SAR4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Búsqueda de una Embarcación en naufragio'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isSAR4Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isSAR4Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget maritimeTraffic() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Tráfico Marítimo',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Fila 1: TM1
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Embarcación CON documentos al día (TODOS)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM1Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM1Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Fila 2: TM2
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación SIN documento (NINGUNO)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM2Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM2Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Fila 3: TM2-1
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM2-1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación SIN Título de Propiedad'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM2_1Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM2_1Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM2-2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Embarcación SIN Certificado de Navegabilidad'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM2_2Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM2_2Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          // Fila 5: TM2-3
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM2-3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Embarcación SIN Permiso para transporte de Turismo'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM2_3Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM2_3Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          // Fila 6: TM2-4
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM2-4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 88.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Embarcación SIN Permiso para transporte de Carga'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM2_4Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM2_4Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Fila 7: TM3
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Embarcación con documentos vencidos (TODOS)'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3-1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text('Embarcación  Certificado de Matrícula VENCIDOS'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3_1Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3_1Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3-2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Text('Embarcación  Certificado de Navegabilidad VENCIDOS'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3_2Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3_2Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Fila 4: TM3-3
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3-3'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación Licencia de Pesca VENCIDOS'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3_3Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3_3Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 5: TM3-4
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3-4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 98.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación Permiso para transporte de Turismos VENCIDOS'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3_4Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3_4Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 6: TM3-5
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM3-5'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcación Permiso para transporte de Carga VENCIDOS'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM3_5Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM3_5Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 7: TM4
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM4'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('CON Zarpe'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM4Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM4Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 8: TM4-1
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM4-1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SIN Zarpe'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM4_1Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM4_1Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 9: TM5
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM5'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcaciones que sobrepasan la autonomía'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM5Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM5Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

// Fila 10: TM6
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('TM6'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 88.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Embarcaciones que sobrepasan la capacidad de carga'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTM6Checked,
                          onChanged: (value) {
                            setState(() {
                              _isTM6Checked = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),




            ],
          ),
        ),
      ],
    );
  }

  Widget beachSecurity() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.black54,
      backgroundColor: Colors.black26,
      iconColor: Colors.deepPurple,
      trailing: Icon(
        _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: Colors.deepPurple,
      ),
      title: const Text(
        'Delito Común',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded1 = expanded;
        });
      },
      initiallyExpanded: _isExpanded1,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CODIGO DE INCIDENTE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DESCRIPCION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Seleccione',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SP1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Rescate de personas en peligro'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 48.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Checkbox(
                          value: _isTSP1Checked, // Valor del checkbox
                          onChanged: (value) {
                            setState(() {
                              _isTSP1Checked = value ??
                                  false; // Actualizar el valor de la variable según el estado del checkbox
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
