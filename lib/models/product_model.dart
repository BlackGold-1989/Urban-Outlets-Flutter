import 'dart:convert';

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
  List<OptionModel> options;
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
  List<GalleryImage> galleryImages;
  List<MediaModel> media;
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
  String jsonData;

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
      this.options,
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
      this.productCondition,
      this.jsonData});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    List<GalleryImage> galleries = [];
    for (var json in map['galleryImages']) {
      GalleryImage gallery = GalleryImage.fromMap(json);
      galleries.add(gallery);
    }

    List<MediaModel> mediaImages = [];
    for (var json in map['media']['images']) {
      MediaModel media = MediaModel.fromMap(json);
      media.type = 'IMAGE';
      mediaImages.add(media);
    }

    List<OptionModel> options = [];
    for (var json in map['options']) {
      OptionModel option = OptionModel.fromMap(json);
      options.add(option);
    }

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
      options: options,
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
      galleryImages: galleries,
      media: mediaImages,
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
      jsonData: jsonEncode(map),
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

class GalleryImage {
  int id;
  String url;
  String thumbnailUrl;
  String thumbnail;
  String smallThumbnailUrl;
  String originalImageUrl;
  String imageUrl;
  String hdThumbnailUrl;
  int width;
  int height;
  int orderBy;

  GalleryImage(
      {this.id,
      this.url,
      this.thumbnailUrl,
      this.thumbnail,
      this.smallThumbnailUrl,
      this.originalImageUrl,
      this.imageUrl,
      this.hdThumbnailUrl,
      this.width,
      this.height,
      this.orderBy});

  factory GalleryImage.fromMap(Map<String, dynamic> map) {
    return new GalleryImage(
      id: map['id'] as int,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      thumbnail: map['thumbnail'] as String,
      smallThumbnailUrl: map['smallThumbnailUrl'] as String,
      originalImageUrl: map['originalImageUrl'] as String,
      imageUrl: map['imageUrl'] as String,
      hdThumbnailUrl: map['hdThumbnailUrl'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      orderBy: map['orderBy'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'url': this.url,
      'thumbnailUrl': this.thumbnailUrl,
      'thumbnail': this.thumbnail,
      'smallThumbnailUrl': this.smallThumbnailUrl,
      'originalImageUrl': this.originalImageUrl,
      'imageUrl': this.imageUrl,
      'hdThumbnailUrl': this.hdThumbnailUrl,
      'width': this.width,
      'height': this.height,
      'orderBy': this.orderBy,
    };
  }
}

class MediaModel {
  String id;
  int orderBy;
  bool isMain;
  String imageOriginalUrl;
  String image800pxUrl;
  String image400pxUrl;
  String image160pxUrl;
  String image1500pxUrl;
  String type;

  MediaModel(
      {this.id,
      this.orderBy,
      this.isMain,
      this.imageOriginalUrl,
      this.image800pxUrl,
      this.image400pxUrl,
      this.image160pxUrl,
      this.image1500pxUrl,
      this.type});

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return new MediaModel(
      id: map['id'] as String,
      orderBy: map['orderBy'] as int,
      isMain: map['isMain'] as bool,
      imageOriginalUrl: map['imageOriginalUrl'] as String,
      image800pxUrl: map['image800pxUrl'] as String,
      image400pxUrl: map['image400pxUrl'] as String,
      image160pxUrl: map['image160pxUrl'] as String,
      image1500pxUrl: map['image1500pxUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'orderBy': this.orderBy,
      'isMain': this.isMain,
      'imageOriginalUrl': this.imageOriginalUrl,
      'image800pxUrl': this.image800pxUrl,
      'image400pxUrl': this.image400pxUrl,
      'image160pxUrl': this.image160pxUrl,
      'image1500pxUrl': this.image1500pxUrl,
    };
  }
}

class OptionModel {
  String type;
  String name;
  int defaultChoice;
  bool required;
  List<ChoiceModel> choices;

  OptionModel(
      {this.type, this.name, this.defaultChoice, this.required, this.choices});

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    var jsonChoices = map['choices'] as List;
    List<ChoiceModel> choices = [];
    for (var json in jsonChoices) {
      ChoiceModel model = ChoiceModel.fromMap(json);
      choices.add(model);
    }
    return new OptionModel(
      type: map['type'] as String,
      name: map['name'] as String,
      defaultChoice: map['defaultChoice'] as int,
      required: map['required'] as bool,
      choices: choices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'name': this.name,
      'defaultChoice': this.defaultChoice,
      'required': this.required,
      'choices': this.choices,
    };
  }
}

class ChoiceModel {
  String text;
  int priceModifier;
  String priceModifierType;

  ChoiceModel({this.text, this.priceModifier, this.priceModifierType});

  factory ChoiceModel.fromMap(Map<String, dynamic> map) {
    return new ChoiceModel(
      text: map['text'] as String,
      priceModifier: map['priceModifier'] as int,
      priceModifierType: map['priceModifierType'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'priceModifier': this.priceModifier,
      'priceModifierType': this.priceModifierType,
    };
  }
}