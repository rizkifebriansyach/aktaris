class Province {
    String name;
    int provinceId;

    Province({
        required this.name,
        required this.provinceId,
    });

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        name: json["name"],
        provinceId: json["province_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "province_id": provinceId,
    };
}