// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.status,
        this.token,
        this.id,
        this.phone,
        this.email,
        this.user,
    });

    String? status;
    String? token;
    String? id;
    String? phone;
    String? email;
    User? user;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        token: json["token"],
        id: json["id"],
        phone: json["phone"],
        email: json["email"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "id": id,
        "phone": phone,
        "email": email,
        "user": user!.toJson(),
    };
}

class User {
    User({
        this.cart,
        this.id,
        this.name,
        this.email,
        this.phone,
        this.role,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    List<dynamic>? cart;
    String? id;
    String? name;
    String? email;
    String? phone;
    String? role;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart!.map((x) => x)),
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "password": password,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
