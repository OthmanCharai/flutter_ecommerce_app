// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';

List<Color> colorFromJson(String str) => List<Color>.from(json.decode(str).map((x) => Color.fromJson(x)));

String colorToJson(List<Color> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Color {
    Color({
        required this.id,
        required this.color,
        required  this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    int id;
    String color;
    DateTime createdAt;
    DateTime updatedAt;
    Pivot pivot;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        color: json["color"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    Pivot({
        required this.productId,
        required this.colorId,
        required this.createdAt,
        required this.updatedAt,
    });

    int productId;
    int colorId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        colorId: json["color_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "color_id": colorId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
