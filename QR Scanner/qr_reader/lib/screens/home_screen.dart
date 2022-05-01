import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/screens/direcciones_screen.dart';
import 'package:qr_reader/screens/mapas_screen.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {

              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();

            }, 
            icon: Icon(Icons.delete_forever)
          ),
        ],
      ),
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigationBar(),

      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {


  @override
  Widget build(BuildContext context){

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO: Temporal leer la base de datos
    //final tempScan = new ScanModel(valor: 'http://AlexHens.com');
    //final intTemp =  DBProvider.db.nuevoScan(tempScan);
    //print(intTemp);

    //DBProvider.db.getScanById(15).then((scan) => print(scan?.valor));
    //DBProvider.db.getTodosLosScans().then(print);

    //DBProvider.db.deleteAllScans().then(print);

    final scanListProvider = Provider.of<ScanListProvider>(context);

    switch (currentIndex){

      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasScreen();
      break;

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesScreen();
      break;


      default: 
        return MapasScreen();
    }
  }
}