import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fondo gris claro similar a la imagen
      appBar: AppBar(
        title: const Text(
          'Investech', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        backgroundColor: Colors.indigo.shade900, // Color de fondo específico para esta pantalla
        actions: const [
          Icon(Icons.notifications_none, color: Colors.amber),
          SizedBox(width: 15),
          Icon(Icons.person_pin, color: Colors.cyan),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Identificación del alumno
            const Text(
              "Mendoza Rubén - 6I",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            // Saludo y Saldo
            const Text(
              "Welcome Back, John",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "\$135,789.23",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
            ),
            const Text(
              "+2.5% this month",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
            ),
            
            const SizedBox(height: 25),

            // Gráfico (Representación visual con un Container)
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Text("Portfolio Performance", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Aquí iría un CustomPaint o una librería de charts
                  Icon(Icons.show_chart, size: 100, color: Colors.indigo.shade300),
                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Sección inferior (Transacciones recientes)
            Row(
              children: [
                Expanded(child: _buildMiniCard("Recent Transactions", "+2.57%")),
                const SizedBox(width: 15),
                Expanded(child: _buildMiniCard("Upcoming Bills", "Next week")),
              ],
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar basado en la imagen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/explorar');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'), // Botón modificado
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMiniCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(color: Colors.green, fontSize: 11)),
        ],
      ),
    );
  }
}