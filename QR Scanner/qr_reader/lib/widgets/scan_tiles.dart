
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/scan_model.dart';
import '../providers/scan_list_provider.dart';
import '../utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({ required this.tipo});

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int index) { 
        ScanModel scanModel = scans[index];
        return Dismissible(
          key: Key(scanModel.id.toString()),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false).borrarScansPorId(scanModel.id!);
          },
          child: ListTile(
            leading: Icon(
              this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined, 
              color: Theme.of(context).primaryColor,
            ),
            title: Text(scanModel.valor),
            subtitle: Text(scanModel.id.toString()),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap: () => launchUrlPropio(context, scanModel),
          ),
        );
      }
    );
  }
}