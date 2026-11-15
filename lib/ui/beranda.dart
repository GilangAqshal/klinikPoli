import 'package:flutter/material.dart';

import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkColor = Color(0xFF172554);
  static const Color backgroundColor = Color(0xFFF1F5F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // SIDEBAR
      drawer: const Sidebar(),

      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: darkColor),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: darkColor,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: darkColor,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // BODY
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WELCOME CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SELAMAT DATANG",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Hello, GIlang Aqshal!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Kelola data fasilitas kesehatan dengan mudah melalui dashboard ini.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.dashboard_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Dashboard Administrator",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // MENU CEPAT
              const Text(
                "Menu Akses Cepat",
                style: TextStyle(
                  color: darkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _quickMenu(
                      icon: Icons.local_hospital_rounded,
                      title: "Fasilitas\nKesehatan",
                      color: const Color(0xFF2563EB),
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _quickMenu(
                      icon: Icons.people_alt_rounded,
                      title: "Data\nPasien",
                      color: const Color(0xFF059669),
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _quickMenu(
                      icon: Icons.badge_rounded,
                      title: "Data\nPegawai",
                      color: const Color(0xFF9333EA),
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // AKTIVITAS TERBARU
              const Text(
                "Aktivitas Terbaru",
                style: TextStyle(
                  color: darkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.history_rounded,
                      size: 38,
                      color: Color(0xFF94A3B8),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Belum Ada Aktivitas",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: darkColor,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Aktivitas sistem akan ditampilkan di sini.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 11),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // FOOTER
              const Center(
                child: Text(
                  "Medical Administration System © 2026",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 11),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  // QUICK MENU
  static Widget _quickMenu({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color, size: 25),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: darkColor,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
