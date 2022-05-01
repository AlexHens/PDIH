
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';


launchUrlPropio(BuildContext context, ScanModel scan) async {
  
  final url = Uri.parse(scan.valor);

  if(scan.tipo == 'http'){
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
  else{
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}