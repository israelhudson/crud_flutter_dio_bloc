class Product {
  int id;
  String nameProduct;
  String price;
  String category;
  String thumbnail;
  bool isSelected = false;

  Product(
      {this.id,
        this.nameProduct,
        this.price,
        this.category,
        this.thumbnail});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameProduct = json['nameProduct'];
    price = json['price'];
    category = json['category'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameProduct'] = this.nameProduct;
    data['price'] = this.price;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}