import 'package:flutter/material.dart';

class MasterDataPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> fields;
  final String primaryField;
  final String secondaryField;

  const MasterDataPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.fields,
    required this.primaryField,
    required this.secondaryField,
  });

  @override
  State<MasterDataPage> createState() => _MasterDataPageState();
}

class _MasterDataPageState extends State<MasterDataPage> {
  final List<Map<String, String>> _records = [];
  int _nextId = 1;

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkColor = Color(0xFF172554);

  String _label(String key) {
    return key
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  Future<void> _showForm({Map<String, String>? record}) async {
    final formKey = GlobalKey<FormState>();
    final controllers = <String, TextEditingController>{
      for (final field in widget.fields)
        field: TextEditingController(text: record?[field] ?? ''),
    };

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(
          record == null ? 'Tambah ${widget.title}' : 'Edit ${widget.title}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: darkColor),
        ),
        content: SizedBox(
          width: 430,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.fields.map((field) {
                  final isPassword = field == 'password';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      controller: controllers[field],
                      obscureText: isPassword,
                      keyboardType: field == 'email'
                          ? TextInputType.emailAddress
                          : field == 'nomor_telepon'
                              ? TextInputType.phone
                              : TextInputType.text,
                      decoration: InputDecoration(
                        labelText: _label(field),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        prefixIcon: Icon(
                          isPassword ? Icons.lock_outline : Icons.edit_outlined,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '${_label(field)} wajib diisi';
                        }
                        if (field == 'email' && !value.contains('@')) {
                          return 'Format email belum benar';
                        }
                        return null;
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              final data = <String, String>{
                for (final field in widget.fields)
                  field: controllers[field]!.text.trim(),
              };
              if (record == null) {
                data['id'] = _nextId.toString();
                _nextId++;
                setState(() => _records.add(data));
              } else {
                data['id'] = record['id'] ?? '';
                final index = _records.indexOf(record);
                if (index >= 0) setState(() => _records[index] = data);
              }
              Navigator.pop(dialogContext);
            },
            icon: const Icon(Icons.save_rounded),
            label: const Text('Simpan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );

    for (final controller in controllers.values) {
      controller.dispose();
    }
  }

  void _showDetail(Map<String, String> record) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(
          'Detail ${widget.title}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: darkColor),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final field in widget.fields)
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(_label(field),
                      style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                  subtitle: Text(
                    field == 'password'
                        ? '••••••••'
                        : (record[field] ?? '-'),
                    style: const TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Tutup'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              _showForm(record: record);
            },
            icon: const Icon(Icons.edit_rounded),
            label: const Text('Edit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              _confirmDelete(record);
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            label: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(Map<String, String> record) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus data?'),
        content: Text('Data ${record[widget.primaryField] ?? ''} akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _records.remove(record));
              Navigator.pop(dialogContext);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(
                color: darkColor, fontWeight: FontWeight.bold, fontSize: 19)),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: darkColor),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: Text('Tambah ${widget.title}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(widget.icon, color: Colors.white, size: 35),
                  const SizedBox(height: 13),
                  Text('Manajemen Data ${widget.title}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 7),
                  Text(widget.subtitle,
                      style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Icon(widget.icon, color: primaryColor, size: 28),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${_records.length}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: darkColor)),
                      Text('Total ${widget.title}',
                          style: const TextStyle(
                              color: Colors.blueGrey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Daftar ${widget.title}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkColor)),
            const SizedBox(height: 13),
            if (_records.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(17)),
                child: Column(
                  children: [
                    const Icon(Icons.inbox_rounded,
                        size: 45, color: Colors.blueGrey),
                    const SizedBox(height: 10),
                    Text('Belum Ada Data ${widget.title}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: darkColor)),
                    const SizedBox(height: 5),
                    const Text('Silakan tambahkan data baru.',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
                  ],
                ),
              )
            else
              ..._records.map((record) => Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 11),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      onTap: () => _showDetail(record),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 7),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFDBEAFE),
                        child: Icon(widget.icon, color: primaryColor),
                      ),
                      title: Text(record[widget.primaryField] ?? '-',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: darkColor)),
                      subtitle: Text(
                        record[widget.secondaryField] ?? '',
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 12),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                    ),
                  )),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
