import 'package:flutter/material.dart';

class MinumanPage extends StatelessWidget {
  const MinumanPage({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minuman'),
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
                  title: 'Air Mineral',
                  description: '',
                  price: 'Rp 5.000',
                  imageUrl: 'assets/air.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Jus Alpukat',
                  description: 'Buah Alpukat, Es batu, SKM Coklat',
                  price: 'Rp 10.000',
                  imageUrl: 'assets/jus.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Cold Brew Coffe',
                  description: 'Kopi yang diseduh dingin dengan rasa yang halus dan sedikit asam.',
                  price: 'Rp 15.000',
                  imageUrl: 'assets/coffe.png', // Ganti dengan path gambar yang sesuai
                ),
                const SizedBox(height: 16), // Margin antara kartu
                _buildListCard(
                  title: 'Ice Tea Lemon',
                  description: 'Teh dingin segar dengan perasan lemon.',
                  price: 'Rp 15.000',
                  imageUrl: 'assets/tea.png', // Ganti dengan path gambar yang sesuai
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
              'assets/minum.png', // Ganti dengan path gambar yang sesuai
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Judul di sebelah kanan
          const Expanded(
            child: Text(
              'Minuman',
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
