import 'package:flutter/material.dart';
import 'master_data_page.dart';

class PasienPage extends StatelessWidget {
  const PasienPage({super.key});

  @override
  Widget build(BuildContext context) => const MasterDataPage(
    title: 'Pasien',
    subtitle: 'Kelola informasi pasien yang terdaftar.',
    icon: Icons.people_alt_rounded,
    fields: [
      'nomor_rm',
      'nama',
      'tanggal_lahir',
      'nomor_telepon',
      'alamat',
    ],
    primaryField: 'nama',
    secondaryField: 'nomor_rm',
  );
}
