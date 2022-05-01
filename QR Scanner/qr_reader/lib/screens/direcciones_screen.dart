import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

import '../models/scan_model.dart';

class DireccionesScreen extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    
    return ScanTiles(tipo: 'http');
  }
}