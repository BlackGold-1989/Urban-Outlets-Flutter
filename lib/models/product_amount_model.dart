class ProductAmountModel {
  int productID;
  int amount;
  int selectedOption;

  ProductAmountModel({this.productID, this.amount, this.selectedOption});

  factory ProductAmountModel.fromMap(Map<String, dynamic> map) {
    return new ProductAmountModel(
      productID: map['productID'] as int,
      amount: map['amount'] as int,
      selectedOption: map['selectedOption'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': this.productID,
      'amount': this.amount,
      'selectedOption' : this.selectedOption,
    };
  }
}