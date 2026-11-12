import 'package:flutter/material.dart';

import '../model/poli.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;
  final VoidCallback onTap;

  const PoliItem({super.key, required this.poli, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.medical_services_rounded,
            color: Color(0xFF2563EB),
            size: 24,
          ),
        ),
        title: Text(
          poli.namaPoli,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF172554),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Poliklinik • Lihat detail",
            style: TextStyle(fontSize: 11, color: Colors.blueGrey),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xFF94A3B8),
          size: 16,
        ),
      ),
    );
  }
}
