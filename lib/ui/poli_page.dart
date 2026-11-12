import 'package:flutter/material.dart';

import '../widget/sidebar.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkColor = Color(0xFF172554);

  final List<Poli> _daftarPoli = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  Future<void> _tambahPoli() async {
    final hasil = await Navigator.push<Poli>(
      context,
      MaterialPageRoute(builder: (_) => const PoliForm()),
    );

    if (hasil != null) {
      setState(() {
        _daftarPoli.add(hasil);
      });
    }
  }

  void _hapusPoli(Poli poli) {
    setState(() {
      _daftarPoli.remove(poli);
    });
  }

  void _ubahPoli(Poli lama, Poli baru) {
    setState(() {
      final index = _daftarPoli.indexOf(lama);
      if (index != -1) {
        _daftarPoli[index] = baru;
      }
    });
  }

  void _bukaDetail(Poli poli) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PoliDetail(poli: poli, onDelete: () => _hapusPoli(poli)),
      ),
    ).then((hasil) {
      if (hasil is Poli) {
        _ubahPoli(poli, hasil);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      drawer: const Sidebar(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: darkColor),
        title: const Text(
          "Data Poli",
          style: TextStyle(
            color: darkColor,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahPoli,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          "Tambah Poli",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.18),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.local_hospital_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Manajemen Data Poli",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Kelola informasi dan data poliklinik dengan mudah.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // STATISTIK
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.medical_services_rounded,
                      color: primaryColor,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_daftarPoli.length}",
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: darkColor,
                        ),
                      ),
                      const Text(
                        "Total Poliklinik",
                        style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 27),

            // DAFTAR POLI
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daftar Poliklinik",
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${_daftarPoli.length} Data",
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            if (_daftarPoli.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.inbox_rounded, size: 45, color: Colors.blueGrey),
                    SizedBox(height: 12),
                    Text(
                      "Belum Ada Data Poli",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Silakan tambahkan data poli baru.",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                  ],
                ),
              )
            else
              ..._daftarPoli.map(
                (poli) => PoliItem(poli: poli, onTap: () => _bukaDetail(poli)),
              ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
