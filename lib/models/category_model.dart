class CategoryModel {
  int id;
  int parentId;
  int orderBy;
  String name;
  String url;
  String thumbnailUrl;
  String imageUrl;
  int productCount;
  bool enabled;
  bool isSampleCategory;

  CategoryModel(
      {this.id,
      this.parentId,
      this.orderBy,
      this.name,
      this.url,
      this.thumbnailUrl,
      this.imageUrl,
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
      thumbnailUrl: (map['thumbnailUrl'] as String)??'url',
      imageUrl: map['imageUrl'] as String,
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
      'thumbnailUrl': this.thumbnailUrl,
      'imageUrl': this.imageUrl,
      'productCount': this.productCount,
      'enabled': this.enabled,
      'isSampleCategory': this.isSampleCategory,
    };
  }
}