// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
    Cart({
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
        required this.carts,
        required this.images,
        required this.colors,
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
    List<CartElement> carts;
    List<Imagees> images;
    List<Colore> colors;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
        carts: List<CartElement>.from(json["carts"].map((x) => CartElement.fromJson(x))),
        images: List<Imagees>.from(json["images"].map((x) => Imagees.fromJson(x))),
        colors: List<Colore>.from(json["colors"].map((x) => Colore.fromJson(x))),
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
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    };
}

class CartElement {
    CartElement({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.password,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
        required this.phone,
        required this.image,
        required this.pivot,
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    String password;
    String rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    String image;
    CartPivot pivot;

    factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        password: json["password"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        image: json["image"],
        pivot: CartPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "password": password,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "phone": phone,
        "image": image,
        "pivot": pivot.toJson(),
    };
}

class CartPivot {
    CartPivot({
        required this.productId,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.quantity,
    });

    int productId;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    int quantity;

    factory CartPivot.fromJson(Map<String, dynamic> json) => CartPivot(
        productId: json["product_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "quantity": quantity,
    };
}

class Colore {
    Colore({
        required this.id,
        required this.color,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    int id;
    String color;
    DateTime createdAt;
    DateTime updatedAt;
    ColorPivot pivot;

    factory Colore.fromJson(Map<String, dynamic> json) => Colore(
        id: json["id"],
        color: json["color"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: ColorPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class ColorPivot {
    ColorPivot({
        required this.productId,
        required this.colorId,
        required this.createdAt,
        required this.updatedAt,
    });

    int productId;
    int colorId;
    DateTime createdAt;
    DateTime updatedAt;

    factory ColorPivot.fromJson(Map<String, dynamic> json) => ColorPivot(
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
