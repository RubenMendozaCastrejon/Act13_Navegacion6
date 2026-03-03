import 'package:flutter/material.dart';

class Revisar_orden extends StatelessWidget {
  const Revisar_orden({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Color Pizarra / Gris oscuro
        backgroundColor: const Color(0xFF37474F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Revisar Orden',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.info_outline, color: Colors.lightBlueAccent),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mendoza Rubén - 6I",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            const Center(
              child: Column(
                children: [
                  Text(
                    "Tesla (TSLA) - Orden de Compra",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Resumen", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Contenedor de Resumen (Basado en la imagen)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue.shade200, width: 2),
                color: const Color(0xFFF8FBFF),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Monto Invertido", "\$1,699.00"),
                  const Divider(height: 30),
                  _buildSummaryRow("Acciones Estimadas", "5.0"),
                  const Divider(height: 30),
                  _buildSummaryRow("Precio por Acción", "\$339.80"),
                  const Divider(height: 30),
                  _buildSummaryRow("Comisión", "\$1.99"),
                  const Divider(height: 30),
                  _buildSummaryRow("Costo Total", "\$1,700.99", isBold: true),
                ],
              ),
            ),

            const Spacer(),

            // Botón Confirmar (Reemplaza al Slide to Confirm)
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/confirmacion');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.double_arrow, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 15)),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontSize: isBold ? 17 : 15,
            color: isBold ? Colors.black : Colors.black87,
          ),
        ),
      ],
    );
  }
}