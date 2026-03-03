import 'package:flutter/material.dart';

class Explorar extends StatelessWidget {
  const Explorar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        // Diferente color de fondo y texto para esta pantalla
        backgroundColor: Colors.teal.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Explorar Mercado',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          // Iconos diferentes a la pantalla anterior
          Icon(Icons.filter_list, color: Colors.orangeAccent),
          SizedBox(width: 15),
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mendoza Rubén - 6I",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Explorar / Mercado",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                // Barra de búsqueda traducida
                TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar activos...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Categorías (Chips)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildCategoryChip("Todos", true),
                _buildCategoryChip("Acciones", false),
                _buildCategoryChip("Fondos", false),
                _buildCategoryChip("Tecnología", false),
                _buildCategoryChip("Energía", false),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Lista de Empresas
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildAssetCard(context, "Google", "GOOGL", "150.25", "+2.57%", Colors.blue),
                _buildAssetCard(context, "Tesla", "TSLA", "789.90", "-1.20%", Colors.red),
                _buildAssetCard(context, "Apple", "AAPL", "175.10", "+0.85%", Colors.grey),
                _buildAssetCard(context, "Bitcoin", "BTC", "45,000.12", "+5.40%", Colors.orange),
                _buildAssetCard(context, "Amazon", "AMZN", "130.45", "+1.15%", Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.teal.shade700 : Colors.white,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  Widget _buildAssetCard(BuildContext context, String name, String symbol, String price, String change, Color iconColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      child: ListTile(
        onTap: () {
          // Navegación a la pantalla de detalle
          Navigator.pushNamed(context, '/detalle');
        },
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(Icons.business, color: iconColor),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(symbol),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              change,
              style: TextStyle(
                color: change.startsWith('+') ? Colors.green : Colors.red,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}