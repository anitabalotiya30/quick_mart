class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category =
        json['category'] != null ? Category?.fromJson(json['category']) : null;
    images = json['images'] != null ? List<String>.from(json['images']) : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category!.toJson();
    data['images'] = images?.map((v) => v).toList();
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
