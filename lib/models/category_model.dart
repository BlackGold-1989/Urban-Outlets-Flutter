class CategoryModel {
  int id;
  int parentId;
  int orderBy;
  String name;
  String url;
  int productCount;
  bool enabled;
  bool isSampleCategory;

  CategoryModel(
      {this.id,
      this.parentId,
      this.orderBy,
      this.name,
      this.url,
      this.productCount,
      this.enabled,
      this.isSampleCategory});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return new CategoryModel(
      id: map['id'] as int,
      parentId: map['parentId'] as int ?? 0,
      orderBy: map['orderBy'] as int,
      name: map['name'] as String,
      url: map['url'] as String,
      productCount: map['productCount'] as int,
      enabled: map['enabled'] as bool,
      isSampleCategory: map['isSampleCategory'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'parentId': this.parentId,
      'orderBy': this.orderBy,
      'name': this.name,
      'url': this.url,
      'productCount': this.productCount,
      'enabled': this.enabled,
      'isSampleCategory': this.isSampleCategory,
    };
  }
}