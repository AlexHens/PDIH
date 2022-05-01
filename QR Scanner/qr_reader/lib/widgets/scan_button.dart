
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      elevation: 0,
      onPressed: () async{

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //final barcodeScanRes = 'https://github.com/AlexHens?tab=repositories';
        //final barcodeScanRes = 'geo:45.287135,-75.920226';

        if(barcodeScanRes == -1){
          return ;
        }

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        //scanListProvider.nuevoScan('geo:15.33,15.66');
        launchUrlPropio(context, nuevoScan);

      }
    );
  }
}