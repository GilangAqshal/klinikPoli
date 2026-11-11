import 'package:flutter/material.dart';

import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/poli_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkColor = Color(0xFF172554);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      elevation: 8,
      width: 285,
      child: Column(
        children: [
          // HEADER PROFILE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(22, 55, 22, 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_rounded,
                      size: 38,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Gilang Aqshal Illham Safatulloh",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "15240871@bsi.ac.id",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Administrator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // MENU LABEL
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "MENU UTAMA",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // MENU HOME
          _buildMenu(
            context,
            icon: Icons.grid_view_rounded,
            title: "Dashboard",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Beranda()),
              );
            },
          ),

          // MENU FASKES
          _buildMenu(
            context,
            icon: Icons.local_hospital_rounded,
            title: "Fasilitas Kesehatan",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PoliPage()),
              );
            },
          ),

          // MENU PEGAWAI
          _buildMenu(
            context,
            icon: Icons.badge_rounded,
            title: "Pegawai",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // MENU PASIEN
          _buildMenu(
            context,
            icon: Icons.people_alt_rounded,
            title: "Pasien",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          const Divider(color: Color(0xFFE2E8F0), indent: 20, endIndent: 20),

          // LOGOUT
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 20),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
              ),
              title: const Text(
                "Keluar",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => Login()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // CUSTOM MENU ITEM
  static Widget _buildMenu(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        leading: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: primaryColor, size: 21),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: darkColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.blueGrey,
          size: 20,
        ),
      ),
    );
  }
}
