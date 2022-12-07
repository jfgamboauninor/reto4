import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto4/controlador/controladorGeneral.dart';
import 'package:reto4/proceso/peticiones.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class listar extends StatefulWidget {
  const listar({super.key});

  @override
  State<listar> createState() => _listarState();
}

class _listarState extends State<listar> {
  controladorGeneral Control = Get.find();

  @override
  void initState() {
    
    super.initState();
    Control.CargarTodaBD();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Control.ListaPosiciones?.isEmpty == false
              ? ListView.builder(
                  itemCount: Control.ListaPosiciones!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                       side: BorderSide(
                       color: Colors.green,
                       width: 4 
                       ),
                      borderRadius: BorderRadius.circular(20.0),
                      ),
                        child: ListTile(
                      leading: Icon(Icons.location_searching_rounded),
                      trailing: IconButton(
                          onPressed: () {
                            Alert(
                                    type: AlertType.warning,
                                    context: context,
                                    title: "¡ADVERTENCIA!",
                                    buttons: [
                                      DialogButton(
                                          color: Colors.green,
                                          child: Text("SI"),
                                          onPressed: () {
                                            PeticionesDB.EliminarUnaPosicion(
                                                Control.ListaPosiciones![index]
                                                    ["id"]);
                                            Control.CargarTodaBD();
                                            Navigator.pop(context);
                                          }),
                                      DialogButton(
                                          color: Colors.red,
                                          child: Text("NO"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ],
                                    desc:
                                        "Esta seguro que desea eliminar esta posicion?")
                                .show();
                          },
                          icon: Icon(Icons.delete_outlined, size: 40.1, color:Colors.black)),
                      title:
                          Text(Control.ListaPosiciones![index]["coordenadas"]),
                      subtitle: Text(Control.ListaPosiciones![index]["fecha"]),
                    ));
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
