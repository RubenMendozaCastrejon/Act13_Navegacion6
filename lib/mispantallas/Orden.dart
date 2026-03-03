import 'package:flutter/material.dart';

class Orden extends StatefulWidget {
  const Orden({super.key});

  @override
  State<Orden> createState() => _OrdenState();
}

class _OrdenState extends State<Orden> {
  bool investInDollars = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        // Color Ámbar profundo y botón de regreso
        backgroundColor: Colors.amber.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nueva Orden',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.help_outline, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.history, color: Colors.black54),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mendoza Rubén - 6I",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            
            // Info de la empresa (Tesla)
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  child: const Icon(Icons.bolt, color: Colors.red),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Orden para Tesla", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("TSLA", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 30),

            // Selector de Monto
            const Text("¿Cuánto deseas invertir?", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Monto",
                prefixText: "\$ ",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),

            const SizedBox(height: 15),

            // Switch de Inversión
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Invertir en dólares"),
              subtitle: const Text("Comprar fracciones de acción"),
              trailing: Switch(
                value: investInDollars,
                activeColor: Colors.amber.shade800,
                onChanged: (val) => setState(() => investInDollars = val),
              ),
            ),

            Text("\$12,345.67 disponibles", style: const TextStyle(color: Colors.grey, fontSize: 13)),

            const SizedBox(height: 25),

            // Tarjeta de estimación
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildEstimateRow("Acciones Estimadas", "1.25 TSLA"),
                  const Divider(height: 30),
                  _buildEstimateRow("Precio por Acción", "\$789.90"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Botón Revisar Orden
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/revisar');
                },
                child: const Text(
                  "Revisar Orden",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstimateRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}