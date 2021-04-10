class ProductModel {
  int id;
  String sku;
  bool unlimited;
  bool inStock;
  String name;
  int price;
  int priceInProductList;
  int defaultDisplayedPrice;
  String defaultDisplayedPriceFormatted;
  String tax;
  bool isShippingRequired;
  int weight;
  String url;
  String created;
  String updated;
  int createTimestamp;
  int updateTimestamp;
  int productClassId;
  bool enabled;
  int warningLimit;
  bool fixedShippingRateOnly;
  int fixedShippingRate;
  String shipping;
  int defaultCombinationId;
  String description;
  String galleryImages;
  String media;
  String categoryIds;
  String categories;
  int defaultCategoryId;
  String seoTitle;
  String seoDescription;
  String favorites;
  String attributes;
  String files;
  String relatedProducts;
  String combinations;
  String dimensions;
  bool isSampleProduct;
  String googleItemCondition;
  bool isGiftCard;
  bool discountsAllowed;
  String subtitle;
  Ribbon ribbon;
  bool nameYourPriceEnabled;
  String productCondition;

  ProductModel(
      {this.id,
      this.sku,
      this.unlimited,
      this.inStock,
      this.name,
      this.price,
      this.priceInProductList,
      this.defaultDisplayedPrice,
      this.defaultDisplayedPriceFormatted,
      this.tax,
      this.isShippingRequired,
      this.weight,
      this.url,
      this.created,
      this.updated,
      this.createTimestamp,
      this.updateTimestamp,
      this.productClassId,
      this.enabled,
      this.warningLimit,
      this.fixedShippingRateOnly,
      this.fixedShippingRate,
      this.shipping,
      this.defaultCombinationId,
      this.description,
      this.galleryImages,
      this.media,
      this.categoryIds,
      this.categories,
      this.defaultCategoryId,
      this.seoTitle,
      this.seoDescription,
      this.favorites,
      this.attributes,
      this.files,
      this.relatedProducts,
      this.combinations,
      this.dimensions,
      this.isSampleProduct,
      this.googleItemCondition,
      this.isGiftCard,
      this.discountsAllowed,
      this.subtitle,
      this.ribbon,
      this.nameYourPriceEnabled,
      this.productCondition});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return new ProductModel(
      id: map['id'] as int,
      sku: map['sku'] as String,
      unlimited: map['unlimited'] as bool,
      inStock: map['inStock'] as bool,
      name: map['name'] as String,
      price: map['price'] as int,
      priceInProductList: map['priceInProductList'] as int,
      defaultDisplayedPrice: map['defaultDisplayedPrice'] as int,
      defaultDisplayedPriceFormatted:
          map['defaultDisplayedPriceFormatted'] as String,
      tax: map['tax'].toString(),
      isShippingRequired: map['isShippingRequired'] as bool,
      weight: map['weight'] as int,
      url: map['url'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
      createTimestamp: map['createTimestamp'] as int,
      updateTimestamp: map['updateTimestamp'] as int,
      productClassId: map['productClassId'] as int,
      enabled: map['enabled'] as bool,
      warningLimit: map['warningLimit'] as int,
      fixedShippingRateOnly: map['fixedShippingRateOnly'] as bool,
      fixedShippingRate: map['fixedShippingRate'] as int,
      shipping: map['shipping'].toString(),
      defaultCombinationId: map['defaultCombinationId'] as int,
      description: map['description'] as String,
      galleryImages: map['galleryImages'].toString(),
      media: map['media'].toString(),
      categoryIds: map['categoryIds'].toString(),
      categories: map['categories'].toString(),
      defaultCategoryId: map['defaultCategoryId'] as int,
      seoTitle: map['seoTitle'] as String,
      seoDescription: map['seoDescription'] as String,
      favorites: map['favorites'].toString(),
      attributes: map['attributes'].toString(),
      files: map['files'].toString(),
      relatedProducts: map['relatedProducts'].toString(),
      combinations: map['combinations'].toString(),
      dimensions: map['dimensions'].toString(),
      isSampleProduct: map['isSampleProduct'] as bool,
      googleItemCondition: map['googleItemCondition'] as String,
      isGiftCard: map['isGiftCard'] as bool,
      discountsAllowed: map['discountsAllowed'] as bool,
      subtitle: map['subtitle'] as String ?? '',
      ribbon: map['ribbon'] != null? Ribbon.fromMap(map['ribbon']) : null,
      nameYourPriceEnabled: map['nameYourPriceEnabled'] as bool,
      productCondition: map['productCondition'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'sku': this.sku,
      'unlimited': this.unlimited,
      'inStock': this.inStock,
      'name': this.name,
      'price': this.price,
      'priceInProductList': this.priceInProductList,
      'defaultDisplayedPrice': this.defaultDisplayedPrice,
      'defaultDisplayedPriceFormatted': this.defaultDisplayedPriceFormatted,
      'tax': this.tax,
      'isShippingRequired': this.isShippingRequired,
      'weight': this.weight,
      'url': this.url,
      'created': this.created,
      'updated': this.updated,
      'createTimestamp': this.createTimestamp,
      'updateTimestamp': this.updateTimestamp,
      'productClassId': this.productClassId,
      'enabled': this.enabled,
      'warningLimit': this.warningLimit,
      'fixedShippingRateOnly': this.fixedShippingRateOnly,
      'fixedShippingRate': this.fixedShippingRate,
      'shipping': this.shipping,
      'defaultCombinationId': this.defaultCombinationId,
      'description': this.description,
      'galleryImages': this.galleryImages,
      'media': this.media,
      'categoryIds': this.categoryIds,
      'categories': this.categories,
      'defaultCategoryId': this.defaultCategoryId,
      'seoTitle': this.seoTitle,
      'seoDescription': this.seoDescription,
      'favorites': this.favorites,
      'attributes': this.attributes,
      'files': this.files,
      'relatedProducts': this.relatedProducts,
      'combinations': this.combinations,
      'dimensions': this.dimensions,
      'isSampleProduct': this.isSampleProduct,
      'googleItemCondition': this.googleItemCondition,
      'isGiftCard': this.isGiftCard,
      'discountsAllowed': this.discountsAllowed,
      'subtitle': this.subtitle,
      'ribbon': this.ribbon,
      'nameYourPriceEnabled': this.nameYourPriceEnabled,
      'productCondition': this.productCondition,
    };
  }
}

class Ribbon {
  String text;
  String color;

  Ribbon({this.text, this.color});

  factory Ribbon.fromMap(Map<String, dynamic> map) {
    return new Ribbon(
      text: map['text'] as String,
      color: map['color'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'color': this.color,
    };
  }
}