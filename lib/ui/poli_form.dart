// Ini ngopy ai
import 'package:flutter/material.dart';

import '../model/poli.dart';
import 'poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);

  @override
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  // Pemisahan Widget Text Field ke dalam Fungsi
  _fieldNamaPoli() {
    return TextField(
      controller: _namaPoliCtrl,
      decoration: const InputDecoration(labelText: "Nama Poli"),
    );
  }

  // Pemisahan Widget Tombol Simpan ke dalam Fungsi
  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
      },
      child: const Text("Simpan"),
    );
  }
}

//Ini kerjain sendiri
// import 'package:flutter/material.dart';

// class PoliForm extends StatefulWidget {
//   const PoliForm({Key? key}) : super(key: key);
//   _PoliFormState createState() => _PoliFormState();
// }

// class _PoliFormState extends State<PoliForm> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Tambah Poli")),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextField(
//                 decoration: const InputDecoration(labelText: "Nama Poli"),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(onPressed: () {}, child: const Text("Simpan")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
