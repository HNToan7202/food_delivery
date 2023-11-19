class Restaurant {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String description;
  final dynamic logo;
  final DateTime createdAt;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.description,
    required this.logo,
    required this.createdAt,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? description,
    dynamic logo,
    DateTime? createdAt,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "description": description,
        "logo": logo,
        "createdAt": createdAt.toIso8601String(),
      };
}
