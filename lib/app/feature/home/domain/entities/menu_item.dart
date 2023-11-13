class MenuItems {
  final String image;
  final String name;
  final double rate;
  final int rating;
  final String type;
  final String foodType;

  MenuItems({
    required this.image,
    required this.name,
    required this.rate,
    required this.rating,
    required this.type,
    required this.foodType,
  });

  factory MenuItems.fromJson(Map<String, dynamic> json) {
    return MenuItems(
      image: json['image'],
      name: json['name'],
      rate: double.parse(json['rate']),
      rating: int.parse(json['rating']),
      type: json['type'],
      foodType: json['food_type'],
    );
  }
}
