class ProductAmountModel {
  String productID;
  int amount;

  ProductAmountModel({this.productID, this.amount});

  factory ProductAmountModel.fromMap(Map<String, dynamic> map) {
    return new ProductAmountModel(
      productID: map['productID'] as String,
      amount: map['amount'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': this.productID,
      'amount': this.amount,
    };
  }
}