import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/screens/home_screen.dart';
import 'package:qr_reader/screens/mapa_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home'  : (_) => HomeScreen(),
          'mapa'  : (_) => MapaScreen()
        },
    
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
    
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple
          ),
          
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          ),
    
        ),
      ),
    );
  }
}


/*
C:\Users\Alejandro\AppData\Local\Google\AndroidStudio2020.3\device-explorer\Note-10_API_30 [emulator-5554]\data\user\0\com.example.qr_reader\app_flutter
*/
