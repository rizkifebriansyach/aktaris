import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';

class NotarisModel extends NotarisListEntity {
  NotarisDetails? notarisDetails;
  OnlineHistory? onlineHistory;
  Price? price;

  NotarisModel({
    this.notarisDetails,
    this.onlineHistory,
    this.price,
  });

  factory NotarisModel.fromJson(Map<String, dynamic> json) => NotarisModel(
        notarisDetails: NotarisDetails.fromJson(json["notaris_details"]),
        onlineHistory: OnlineHistory.fromJson(json["online_history"]),
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "notaris_details": notarisDetails?.toJson(),
        "online_history": onlineHistory?.toJson(),
        "price": price?.toJson(),
      };
}

class NotarisDetails {
  int? id;
  int? userId;
  String? noSk;
  String? name;
  String? alumnus;
  String? pengalaman;
  String? placeOfBirth;
  String? dateOfBirth;
  String? address;
  String? city;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotarisDetails({
    this.id,
    this.userId,
    this.noSk,
    this.name,
    this.alumnus,
    this.pengalaman,
    this.placeOfBirth,
    this.dateOfBirth,
    this.address,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  factory NotarisDetails.fromJson(Map<String, dynamic> json) => NotarisDetails(
        id: json["Id"],
        userId: json["user_id"],
        noSk: json["no_sk"],
        name: json["name"],
        alumnus: json["alumnus"],
        pengalaman: json["Pengalaman"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"],
        address: json["address"],
        city: json["city"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "user_id": userId,
        "no_sk": noSk,
        "name": name,
        "alumnus": alumnus,
        "Pengalaman": pengalaman,
        "place_of_birth": placeOfBirth,
        "date_of_birth":dateOfBirth,
            // "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "address": address,
        "city": city,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class OnlineHistory {
  int? historyId;
  int? userId;
  bool? active;
  String? status;
  DateTime? checkIn;
  DateTime? checkOut;

  OnlineHistory({
    this.historyId,
    this.userId,
    this.active,
    this.status,
    this.checkIn,
    this.checkOut,
  });

  factory OnlineHistory.fromJson(Map<String, dynamic> json) => OnlineHistory(
        historyId: json["history_id"],
        userId: json["user_id"],
        active: json["active"],
        status: json["status"],
        checkIn: DateTime.parse(json["check_in"]),
        checkOut: DateTime.parse(json["check_out"]),
      );

  Map<String, dynamic> toJson() => {
        "history_id": historyId,
        "user_id": userId,
        "active": active,
        "status": status,
        "check_in": checkIn?.toIso8601String(),
        "check_out": checkOut?.toIso8601String(),
      };
}

class Price {
  int? priceId;
  int? price;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  Price({
    this.priceId,
    this.price,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        priceId: json["price_id"],
        price: json["price"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "price_id": priceId,
        "price": price,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
