class Product {
  int id;
  String nameProduct;
  String price;
  String category;
  String thumbnail;
  String isSelected;

  Product(
      {this.id,
        this.nameProduct,
        this.price,
        this.category,
        this.thumbnail,
        this.isSelected});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameProduct = json['nameProduct'];
    price = json['price'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameProduct'] = this.nameProduct;
    data['price'] = this.price;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['isSelected'] = this.isSelected;
    return data;
  }
}