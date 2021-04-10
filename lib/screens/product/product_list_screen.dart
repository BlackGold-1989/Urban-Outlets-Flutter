import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_outlets/models/category_model.dart';
import 'package:urban_outlets/models/product_model.dart';
import 'package:urban_outlets/services/network_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/consts.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryModel model;

  const ProductListScreen({
    Key key,
    this.model
  }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _getData();
    });
  }

  _getData() async {
    String url = 'products\?token=$token&category=${widget.model.id}&withSubcategories=true';
    var resp = await NetworkService(context).ajax(url, isProgress: true);
    products.clear();
    for (var json in resp['items']) {
      ProductModel model  = ProductModel.fromMap(json);
      products.add(model);
    }
    setState(() {});
  }

  Widget getAvatarWidget(ProductModel model) {
    var images = jsonDecode(model.galleryImages) as List;
    if (images.isEmpty) {
      return SvgPicture.asset('assets/images/logo.svg', width: 36.0, height: 36.0,);
    } else {
      return Image.network(images.first, width: 36.0, height: 36.0,);
    }
  }

  Widget getRibbonWidget(ProductModel model) {
    return model.ribbon == null
        ? Container()
        : Container(
          padding: EdgeInsets.symmetric(horizontal: offsetSm, vertical: offsetXSm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(offsetXSm),
                topRight: Radius.circular(offsetXSm)
            ),
            color: HexColor.fromHex(model.ribbon.color).withOpacity(0.75),
          ),
          child: Text(model.ribbon.text, style: mediumText.copyWith(fontSize: fontXSm, color: Colors.white),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: widget.model.name + ' (${widget.model.productCount})',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetBase),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: offsetBase),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(offsetBase)),
              ),
              elevation: 1,
              shadowColor: primaryColor.withOpacity(0.3),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(offsetBase),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                          child: getAvatarWidget(products[index]),
                        ),
                        SizedBox(width: offsetBase,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].name,
                                maxLines: 1,
                                style: semiBold.copyWith(fontSize: fontMd, color: primaryColor),
                              ),
                              Text(products[index].subtitle,
                                maxLines: 1,
                                style: mediumText.copyWith(fontSize: fontSm, color: Colors.grey),
                              ),
                              Text('Price: ${products[index].defaultDisplayedPriceFormatted}',
                                maxLines: 1,
                                style: mediumText.copyWith(fontSize: fontSm, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (products[index].productCondition == 'NEW') Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/badge_new.png', width: 28.0, height: 28.0,)
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.only(right: offsetBase),
                          child: getRibbonWidget(products[index]),),
                    ),
                  ),
                ],
              )
            );
          }
        ),
      ),
    );
  }
}
