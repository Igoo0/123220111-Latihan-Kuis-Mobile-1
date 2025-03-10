import 'package:flutter/material.dart';
import 'order_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> menu = [
    {"name": "Nasi Goreng", "price": 15000, "image": "assets/ayam.jpg"},
    {"name": "Mie Gomak", "price": 12000, "image": "assets/miegomak.jpg"},
    {"name": "pizza", "price": 20000, "image": "assets/pizza.jpg"},
    {"name": "saksang", "price": 10000, "image": "assets/saksang.jpg"},
    {"name": "Soto Ayam", "price": 18000, "image": "assets/soto.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Halo abed", style: TextStyle(fontSize: 16)),
            Text("Mau Makan Apa Hari ini?", style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              // Tambahkan fungsi logout di sini jika diperlukan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar besar di atas
            Image.asset("assets/ayam.jpg", height: 180, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 10),

            // Judul Daftar Menu
            Text("Daftar Menu:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // GridView untuk daftar menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // Menyesuaikan ukuran Card
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  final item = menu[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"], width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(item["name"], style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Rp ${item["price"]}"),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: Text("Pesan", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(
                                  name: item["name"],
                                  price: item["price"],
                                  image: item["image"],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
