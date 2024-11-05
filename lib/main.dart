import 'package:flutter/material.dart';
import 'detail_pages/makanan_pokok.dart';
import 'detail_pages/minuman.dart';
import 'detail_pages/makanan_pembuka.dart';
import 'detail_pages/makanan_penutup.dart';
 void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Sesuaikan tinggi jika diperlukan
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
          child: AppBar(
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: Container(
              width: double.infinity, // Agar mengambil seluruh lebar
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Menu Makanan & Minuman', // Teks di dalam input
                  prefixIcon: const Icon(Icons.restaurant_menu, color: Colors.red), // Ikon di sebelah kiri
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                onChanged: (value) {
                  // Lakukan sesuatu dengan input pencarian
                  print("Searching for: $value");
                },
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert), // Anda bisa mengganti ikon ini jika perlu
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _headerSection(),
          Expanded(child: _gridMenu(context)),
        ],
      ),
      bottomNavigationBar:ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)), // Sudut atas membulat
        child:BottomAppBar(
          color: Colors.green,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
    ),

    );
  }

  Widget _headerSection() { 
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Menambahkan margin atas
      height: 200.0, // Atur tinggi sesuai kebutuhan
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/header.png'), // Ganti sesuai path gambar
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: ClipRRect( // Menggunakan ClipRRect untuk mengaplikasikan borderRadius
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: Center(
          child: Text(
            'Welcome to The Alv the Resto',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridMenu(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {'title': 'Makanan Pokok', 'image': 'assets/pokok.png'},
      {'title': 'Minuman', 'image': 'assets/minum.png'},
      {'title': 'Makanan Pembuka', 'image': 'assets/pembuka.png'},
      {'title': 'Makanan Penutup', 'image': 'assets/penutup.png'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman sesuai item
            if (item['title'] == 'Makanan Pokok') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakananPokokPage()),
              );
            } else if (item['title'] == 'Minuman') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MinumanPage()),
              );
            } else if (item['title'] == 'Makanan Pembuka') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakananPembukaPage()),
              );
            } else if (item['title'] == 'Makanan Penutup') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakananPenutupPage()),
              );
            }
          },
          child: _menuCard(item['title']!, item['image']!),
        );
      },
    );
  }

  Widget _menuCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
