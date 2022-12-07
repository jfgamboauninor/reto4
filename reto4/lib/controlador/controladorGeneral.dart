import 'package:get/get.dart';
import 'package:reto4/proceso/peticiones.dart';

class controladorGeneral extends GetxController {
  final Rxn<List<Map<String, dynamic>>> _listaPosiciones =
      Rxn<List<Map<String, dynamic>>>();
  final _unaPosicion = "".obs;


  void cargaUnaPosicion(String X) {
    _unaPosicion.value = X;
  }

  String get unaPosicion => _unaPosicion.value;


  void cargaListaPosiciones(List<Map<String, dynamic>> X) {
    _listaPosiciones.value = X;
  }

  List<Map<String, dynamic>>? get ListaPosiciones => _listaPosiciones.value;



  Future<void> CargarTodaBD() async {
    final datos = await PeticionesDB.MostrarTodasUbicaciones();
    cargaListaPosiciones(datos);
  }
}
