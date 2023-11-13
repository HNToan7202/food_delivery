class FoodCategory {
  final String name;
  final String image;
  final int itemsCount;

  FoodCategory({
    required this.name,
    required this.image,
    required this.itemsCount,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      name: json['name'],
      image: json['image'],
      itemsCount: int.parse(json['items_count']),
    );
  }
}
