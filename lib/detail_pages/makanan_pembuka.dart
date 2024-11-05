import 'package:flutter/material.dart';

class MakananPembukaPage extends StatelessWidget {
  const MakananPembukaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makanan Pembuka'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16), // Margin atas sebelum header
          _buildHeader(), // Menambahkan header dengan gambar dan judul
          const SizedBox(height: 16), // Margin di bawah header
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildListCard(
                  title: 'Spring rolls',
                  description: 'Lumpia, Sayursn, Daging, Saus.',
                  price: 'Rp 10.000',
                  imageUrl: 'assets/spring.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Bruschetta',
                  description: 'Roti panggang, Tomat, Minyak zaitun.',
                  price: 'Rp 15.000',
                  imageUrl: 'assets/bruschetta.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Soup Cream of Mushroom',
                  description: 'Krim Jamur, Roti panggang renyah.',
                  price: 'Rp 15.000',
                  imageUrl: 'assets/soup.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Calamari',
                  description: 'Cumi-cumi.',
                  price: 'Rp 20.000',
                  imageUrl: 'assets/cumi.png', // Ganti dengan path gambar yang sesuai
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Margin kanan dan kiri
      decoration: BoxDecoration(
        color: Colors.green, // Warna latar belakang header
        borderRadius: BorderRadius.circular(10), // Semua sudut melengkung
      ),
      child: Row(
        children: [
          // Gambar di sebelah kiri
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/pembuka.png', // Ganti dengan path gambar yang sesuai
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Judul di sebelah kanan
          const Expanded(
            child: Text(
              'Makanan Pembuka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListCard({
    required String title,
    required String description,
    required String price,
    required String imageUrl,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Informasi Makanan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Gambar Makanan
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
