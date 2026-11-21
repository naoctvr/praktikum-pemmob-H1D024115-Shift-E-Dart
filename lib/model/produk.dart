class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;

  Produk({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});

  factory Produk.fromJson(Map<String, dynamic> obj) {
    var rawId = obj['id'];
    var rawHarga = obj['harga'];

    return Produk(
      id: rawId is int ? rawId : int.tryParse(rawId?.toString() ?? ''),
      kodeProduk: obj['kode_produk'],
      namaProduk: obj['nama_produk'],
      hargaProduk: rawHarga is int ? rawHarga : int.tryParse(rawHarga?.toString() ?? ''),
    );
  }
}
