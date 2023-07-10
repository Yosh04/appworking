

import 'package:open_file/open_file.dart';


///Es un metodo basasdo en seleccionar en archivos.  utilizando librerias.
void pickFile(String filePath) async {
  OpenFile.open(filePath); // Abre el archivo usando la ruta proporcionada
}