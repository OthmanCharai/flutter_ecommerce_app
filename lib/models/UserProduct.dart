// To parse this JSON data, do
//
//     final userProduct = userProductFromJson(jsonString);

import 'dart:convert';

List<UserProduct> userProductFromJson(String str) => List<UserProduct>.from(json.decode(str).map((x) => UserProduct.fromJson(x)));

String userProductToJson(List<UserProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProduct {
    UserProduct({
        required this.id,
        required this.name,
        required this.description,
        required this.quantity,
        required this.status,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.price,
        required this.isPopulaire,
        required this.images,
    });

    int id;
    String name;
    String description;
    int quantity;
    String status;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String price;
    String isPopulaire;
    List<Imagees> images;

    factory UserProduct.fromJson(Map<String, dynamic> json) => UserProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        status: json["status"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        price: json["price"],
        isPopulaire: json["isPopulaire"],
        images: List<Imagees>.from(json["images"].map((x) => Imagees.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "quantity": quantity,
        "status": status,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "price": price,
        "isPopulaire": isPopulaire,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Imagees {
    Imagees({
        required this.id,
        required this.image,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String image;
    int productId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Imagees.fromJson(Map<String, dynamic> json) => Imagees(
        id: json["id"],
        image: json["image"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
