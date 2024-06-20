class City {
    String id;
    String nama;

    City({
        required this.id,
        required this.nama,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}
