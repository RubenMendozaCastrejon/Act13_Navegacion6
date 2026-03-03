import 'package:flutter/material.dart';

// Importación de tus pantallas
import 'mispantallas/DashBoard.dart';
import 'mispantallas/Explorar.dart';
import 'mispantallas/Empresa_Det.dart';
import 'mispantallas/Orden.dart';
import 'mispantallas/Revisar_orden.dart';
import 'mispantallas/Realizada.dart';

void main() {
  runApp(const InvestechApp());
}

class InvestechApp extends StatelessWidget {
  const InvestechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investech',
      debugShowCheckedModeBanner: false,
      
      // Configuración del tema (opcional, estilo financiero)
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),

      // Ruta inicial
      initialRoute: '/',

      // Definición de las rutas nombradas
      routes: {
        '/': (context) => const DashBoard(),
        '/explorar': (context) => const Explorar(),
        '/detalle': (context) => const Empresa_Det(),
        '/orden': (context) => const Orden(),
        '/revisar': (context) => const Revisar_orden(),
        '/confirmacion': (context) => const Realizada(),
      },
    );
  }
}