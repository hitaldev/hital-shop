class Product {
  int? id;
  String? title;
  String? image;
  String? price;
  String? realPrice;
  int? discountPercent;
  String? description;
  String? category;
  List<String>? gallery;
  int? reviewsCount;
  bool? bookmarked;
  int? cartCount;
  int? count;

  Product(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.realPrice,
        this.description,
        this.category,
        this.bookmarked,
        this.cartCount,
        this.count,
        this.discountPercent});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    realPrice = json['real_price'];
    discountPercent = json['discount_percent'];
    description = json['description'];
    category = json['category'];
    reviewsCount = json["reviews_count"];
    bookmarked = json["bookmarked"];
    cartCount = json["cart_count"];
    count = json["count"];
    if(json["gallery"] != null) {
      gallery = json["gallery"].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['real_price'] = this.realPrice;
    data['discount_percent'] = this.discountPercent;
    return data;
  }
}
