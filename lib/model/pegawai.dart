class Pegawai {
  final int id;
  final String nip;
  final String nama;
  final String tanggalLahir;
  final String nomorTelepon;
  final String email;
  final String password;

  const Pegawai({
    required this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() => {
    'id': id.toString(),
    'nip': nip,
    'nama': nama,
    'tanggal_lahir': tanggalLahir,
    'nomor_telepon': nomorTelepon,
    'email': email,
    'password': password,
  };

  factory Pegawai.fromMap(Map<String, String> map) => Pegawai(
    id: int.tryParse(map['id'] ?? '') ?? 0,
    nip: map['nip'] ?? '',
    nama: map['nama'] ?? '',
    tanggalLahir: map['tanggal_lahir'] ?? '',
    nomorTelepon: map['nomor_telepon'] ?? '',
    email: map['email'] ?? '',
    password: map['password'] ?? '',
  );
}
