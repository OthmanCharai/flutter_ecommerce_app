/* // To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
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
        required this.colors,
        required this.buyer,
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
    List<Images> images;
    List<ColorElement> colors;
    List<Buyer> buyer;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        colors: List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
        buyer: List<Buyer>.from(json["user"].map((x) => Buyer.fromJson(x))),
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
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "buyer": List<dynamic>.from(buyer.map((x) => x.toJson())),
    };
    hexStringToHexInt(String hex) {
        hex = hex.replaceFirst('#', '');
        hex = hex.length == 6 ? 'ff' + hex : hex;
        int val = int.parse(hex, radix: 16);
        return val;
    }
}

class Buyer {
    Buyer({
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
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    Password ?password;
    String rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    String image;

    factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        password: passwordValues.map[json["password"]],
        rememberToken: json["remember_token"],
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
        "password": passwordValues.reverse[password],
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "phone": phone,
        "image": image,
    };
}

enum Password { THE_2_Y_1092_IXU_NPKJ_O0_R_OQ5_BY_MI_YE4_O_KO_EA3_RO9_LL_C_OG_AT2_UHE_WG_IGI }

final passwordValues = EnumValues({
    "\u00242y\u002410\u002492IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi": Password.THE_2_Y_1092_IXU_NPKJ_O0_R_OQ5_BY_MI_YE4_O_KO_EA3_RO9_LL_C_OG_AT2_UHE_WG_IGI
});



class ColorElement {
    ColorElement({
        required this.id,
        required this.color,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    int id;
    String  color;
    DateTime createdAt;
    DateTime updatedAt;
    ColorPivot pivot;

    factory ColorElement.fromJson(Map<String, dynamic> json) => ColorElement(
        id: json["id"],
        color: json["color"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: ColorPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": colorEnumValues.reverse[color],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

enum ColorEnum { DARK_VIOLET, LIGHT_YELLOW, OLIVE_DRAB, MINT_CREAM, DARK_OLIVE_GREEN }

final colorEnumValues = EnumValues({
    "DarkOliveGreen": ColorEnum.DARK_OLIVE_GREEN,
    "DarkViolet": ColorEnum.DARK_VIOLET,
    "LightYellow": ColorEnum.LIGHT_YELLOW,
    "MintCream": ColorEnum.MINT_CREAM,
    "OliveDrab": ColorEnum.OLIVE_DRAB
});

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

class Images {
    Images({
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

    factory Images.fromJson(Map<String, dynamic> json) => Images(
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
   
}
 */
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
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
        required this.colors,
        required this.buyer,
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
    List<Images> images;
    List<ColorElement> colors;
    Buyer buyer;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        colors: List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
        buyer: Buyer.fromJson(json["user"]),
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
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "user": buyer.toJson(),
    };
}

class ColorElement {
    ColorElement({
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
    Pivote pivot;

    factory ColorElement.fromJson(Map<String, dynamic> json) => ColorElement(
        id: json["id"],
        color: json["color"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivote.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": colorEnumValues.reverse[color],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

enum ColorEnum { THE_2_DF552, BB4_ACE, D93_D9_A, E679_BC, THE_9092_A4 }

final colorEnumValues = EnumValues({
    "#bb4ace": ColorEnum.BB4_ACE,
    "#d93d9a": ColorEnum.D93_D9_A,
    "#e679bc": ColorEnum.E679_BC,
    "#2df552": ColorEnum.THE_2_DF552,
    "#9092a4": ColorEnum.THE_9092_A4
});

class Pivote {
    Pivote({
        required this.productId,
        required this.colorId,
        required this.createdAt,
        required this.updatedAt,
    });

    int productId;
    int colorId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Pivote.fromJson(Map<String, dynamic> json) => Pivote(
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

class Images {
    Images({
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

    factory Images.fromJson(Map<String, dynamic> json) => Images(
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

class Buyer {
    Buyer({
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
    });

    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    Password ? password;
    String rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    String image;

    factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        password: passwordValues.map[json["password"]],
        rememberToken: json["remember_token"],
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
        "password": passwordValues.reverse[password],
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "phone": phone,
        "image": image,
    };
}

enum Password { THE_2_Y_1092_IXU_NPKJ_O0_R_OQ5_BY_MI_YE4_O_KO_EA3_RO9_LL_C_OG_AT2_UHE_WG_IGI }

final passwordValues = EnumValues({
    "\u00242y\u002410\u002492IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi": Password.THE_2_Y_1092_IXU_NPKJ_O0_R_OQ5_BY_MI_YE4_O_KO_EA3_RO9_LL_C_OG_AT2_UHE_WG_IGI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
