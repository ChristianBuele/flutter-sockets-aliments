import 'dart:convert';
import 'dart:ffi';

Alimentation alimentationFromJson(String str) => Alimentation.fromJson(json.decode(str));

String alimentationToJson(Alimentation data) => json.encode(data.toJson());

class Alimentation {
    Alimentation({
        required this.id,
        required this.comida,
        required this.name,
        required this.porcion,
        required this.userId,
        this.productos,
        this.user,
        required this.createAt,
    });

     int id;
    int comida;
    String name;
    double porcion;
    int userId;
    dynamic productos;
    dynamic user;
    DateTime createAt;

    factory Alimentation.fromJson(Map<String, dynamic> json) => Alimentation(
        id: json["id"],
        comida: json["comida"],
        name: json["name"],
        porcion: json["porcion"],
        userId: json["userId"],
        productos: json["productos"],
        user: json["user"],
        createAt: DateTime.parse(json["createAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comida": comida,
        "name": name,
        "porcion": porcion,
        "userId": userId,
        "productos": productos,
        "user": user,
        "createAt": createAt.toIso8601String(),
    };
}