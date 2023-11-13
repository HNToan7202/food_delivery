class ItemsMore {
  String index;
  String name;
  String image;
  int base;
  ItemsMore(
      {required this.index,
      required this.name,
      required this.image,
      required this.base});
  factory ItemsMore.fromJson(Map<String, dynamic> json) {
    return ItemsMore(
      index: json['index'],
      name: json['name'],
      image: json['image'],
      base: json['base'],
    );
  }
}
