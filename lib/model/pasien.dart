class Pasien {
  final int id;
  final String nomorRm;
  final String nama;
  final String tanggalLahir;
  final String nomorTelepon;
  final String alamat;

  const Pasien({
    required this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  Map<String, String> toMap() => {
    'id': id.toString(),
    'nomor_rm': nomorRm,
    'nama': nama,
    'tanggal_lahir': tanggalLahir,
    'nomor_telepon': nomorTelepon,
    'alamat': alamat,
  };

  factory Pasien.fromMap(Map<String, String> map) => Pasien(
    id: int.tryParse(map['id'] ?? '') ?? 0,
    nomorRm: map['nomor_rm'] ?? '',
    nama: map['nama'] ?? '',
    tanggalLahir: map['tanggal_lahir'] ?? '',
    nomorTelepon: map['nomor_telepon'] ?? '',
    alamat: map['alamat'] ?? '',
  );
}
