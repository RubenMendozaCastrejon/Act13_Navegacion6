import 'package:flutter/material.dart';

class Realizada extends StatelessWidget {
  const Realizada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Color Verde Esmeralda para éxito
        backgroundColor: Colors.teal.shade600,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transacción Exitosa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.download_done_outlined, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.share_arrival_time_outlined, color: Colors.black26),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mendoza Rubén - 6I",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Spacer(),
            
            // Icono de Check Gigante (Basado en la imagen)
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF66BB6A),
              child: Icon(Icons.check, size: 80, color: Colors.white),
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              "¡Transacción Exitosa!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 10),
            
            const Text(
              "Tu orden ha sido ejecutada correctamente.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Tarjeta de confirmación de compra
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Compraste 5 acciones de Tesla (TSLA) por \$1,700.99",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            // Botón Volver al Dashboard
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  // Esta función vuelve a la pantalla inicial y borra las anteriores
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: const Text(
                  "Volver a Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}