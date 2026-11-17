import 'package:flutter/material.dart';
import 'master_data_page.dart';

class PegawaiPage extends StatelessWidget {
  const PegawaiPage({super.key});

  @override
  Widget build(BuildContext context) => const MasterDataPage(
    title: 'Pegawai',
    subtitle: 'Kelola informasi pegawai yang terdaftar.',
    icon: Icons.badge_rounded,
    fields: [
      'nip',
      'nama',
      'tanggal_lahir',
      'nomor_telepon',
      'email',
      'password',
    ],
    primaryField: 'nama',
    secondaryField: 'nip',
  );
}
