import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final int price;
  final String image;

  OrderPage({required this.name, required this.price, required this.image});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController quantityController = TextEditingController(text: "1");
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    updateTotalPrice(); // Hitung harga awal
    quantityController.addListener(updateTotalPrice);
  }

  void updateTotalPrice() {
    setState(() {
      int quantity = int.tryParse(quantityController.text) ?? 0;
      totalPrice = widget.price * quantity;
    });
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Order"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar makanan dari assets
            Image.asset(widget.image, height: 150, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 20),

            // Nama makanan
            Text(widget.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),

            // Harga makanan
            Text("Harga: Rp ${widget.price}", style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            SizedBox(height: 20),

            // Input jumlah pesanan
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Jumlah",
              ),
            ),
            SizedBox(height: 20),

            // Tombol submit
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
              child: Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pesanan dikonfirmasi!")),
                );
              },
            ),
            SizedBox(height: 20),

            // Total harga
            Text("Total Harga: Rp $totalPrice",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
