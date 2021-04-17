import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban_outlets/models/product_amount_model.dart';
import 'package:urban_outlets/models/product_model.dart';

class PreferenceService {
  final String keyFavoriteProduct = 'key_favorite_product';
  final String keyCartProduct = 'key_cart_product';
  final String keyCartAmount = 'key_cart_amount';

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveCartProducts(List<ProductModel> models) async {
    final SharedPreferences prefs = await _prefs;
    List<String> prefData = [];
    for (var model in models) {
      prefData.add(model.jsonData);
    }
    await prefs.setStringList(keyCartProduct, prefData);
  }

  Future<List<ProductModel>> getCartProducts() async {
    final SharedPreferences prefs = await _prefs;
    List<String> strData = prefs.getStringList(keyCartProduct) ?? [];
    List<ProductModel> models = [];
    for (var str in strData) {
      ProductModel model = ProductModel.fromMap(jsonDecode(str));
      models.add(model);
    }
    return models;
  }

  Future<void> saveCartAmount(List<ProductAmountModel> models) async {
    final SharedPreferences prefs = await _prefs;
    List<String> prefData = [];
    for (var amount in models) {
      String data = jsonEncode(amount.toMap());
      prefData.add(data);
    }
    await prefs.setStringList(keyCartAmount, prefData);
  }

  Future<List<ProductAmountModel>> getCardAmount() async {
    final SharedPreferences prefs = await _prefs;
    List<String> strData = prefs.getStringList(keyCartAmount) ?? [];
    List<ProductAmountModel> models = [];
    for (var str in strData) {
      ProductAmountModel model = ProductAmountModel.fromMap(jsonDecode(str));
      models.add(model);
    }
    return models;
  }

}