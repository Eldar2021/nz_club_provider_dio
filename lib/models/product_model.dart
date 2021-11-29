class VideoProduct {
  final int id;
  final String name;
  final String description;
  final double price;
  final int video;
  final String image;

  VideoProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.video,
    required this.image,
  });

  factory VideoProduct.fromJson(Map<String, dynamic> json) {
    return VideoProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      video: json['video'],
      image: json['image'],
    );
  }

  static fromList(List list) =>
      list.map((e) => VideoProduct.fromJson(e)).toList();

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'video': video,
      };
}
