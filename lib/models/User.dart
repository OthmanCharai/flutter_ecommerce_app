// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.user,
        required this.favorites,
    });

    UserClass user;
    List<Favorite> favorites;

    factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
    };
}

class Favorite {
    Favorite({
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
        required this.pivot,
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
    Pivot pivot;

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
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
        pivot: Pivot.fromJson(json["pivot"]),
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
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    Pivot({
        required this.userId,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
    });

    int userId;
    int productId;
    dynamic createdAt;
    dynamic updatedAt;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        productId: json["product_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class UserClass {
    UserClass({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.phone,
        required this.image,
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    String image;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "phone": phone,
        "image": image,
    };
}
