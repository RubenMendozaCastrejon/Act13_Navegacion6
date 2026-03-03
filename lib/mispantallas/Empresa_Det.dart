import 'package:flutter/material.dart';

class Empresa_Det extends StatelessWidget {
  const Empresa_Det({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        // Nuevo color: Morado profundo
        backgroundColor: Colors.deepPurple.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Detalle de Empresa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          // Iconos aleatorios nuevos
          Icon(Icons.favorite_border, color: Colors.pinkAccent),
          SizedBox(width: 15),
          Icon(Icons.share, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mendoza Rubén - 6I",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  // Encabezado de la empresa (Basado en la imagen)
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.electric_car, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Tesla (TSLA)",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contenedor del Gráfico
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 150, child: Center(child: Icon(Icons.stacked_line_chart, size: 80, color: Colors.blue))),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTimeOption("Día", true),
                      _buildTimeOption("Sem.", false),
                      _buildTimeOption("Mes", false),
                      _buildTimeOption("Año", false),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Estadísticas Clave
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Estadísticas Clave", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 10),

            // Lista de datos traducidos
            _buildStatRow("Precio Actual", "\$789.90", Colors.green),
            _buildStatRow("Máximo de Hoy", "\$795.50", Colors.grey),
            _buildStatRow("Cap. de Mercado", "\$1.2 Trillones", Colors.grey),
            _buildStatRow("Ratio P/E", "250x", Colors.grey),

            const SizedBox(height: 30),

            // Botón de Compra
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    // Navegación a la pantalla de Orden
                    Navigator.pushNamed(context, '/orden');
                  },
                  child: const Text(
                    "Comprar",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeOption(String label, bool isSelected) {
    return Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.blue : Colors.grey,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildStatRow(String title, String value, Color valueColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: valueColor)),
        ],
      ),
    );
  }
}