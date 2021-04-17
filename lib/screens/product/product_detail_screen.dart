import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_outlets/models/product_amount_model.dart';
import 'package:urban_outlets/models/product_model.dart';
import 'package:urban_outlets/screens/main_screen.dart';
import 'package:urban_outlets/services/dialog_service.dart';
import 'package:urban_outlets/services/pref_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';
import 'package:urban_outlets/widgets/button_widget.dart';
import 'package:urban_outlets/widgets/textfield_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel model;

  const ProductDetailScreen({Key key, this.model}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final PageController controller = PageController(initialPage: 0);
  int selectedIndex = 0;
  List<int> selectedOptions = [];

  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var option in widget.model.options) {
      selectedOptions.add(option.defaultChoice);
    }
    setState(() {
      amountController.text = '1';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MainBarWidget(
          titleString: widget.model.name,
          actions: [
            IconButton(
                icon: Badge(
                  badgeContent: Text('${cartModels.length}', style: TextStyle(color: Colors.white, fontSize: 10.0),),
                    child: Icon(Icons.shopping_cart_outlined, color: primaryColor,)),
                onPressed: () {

            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    widget.model.galleryImages.isEmpty
                        ? SvgPicture.asset('assets/images/logo.svg', fit: BoxFit.cover,)
                        : PageView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      children: [
                        for (var media in widget.model.media)
                          Image.network(media.imageOriginalUrl, fit: BoxFit.cover,),
                      ],
                    ),
                    if (widget.model.media.isNotEmpty) Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(offsetBase)
                          )
                        ),
                        child: Text('${selectedIndex + 1} / ${widget.model.media.length}', style: semiBold.copyWith(fontSize: fontBase, color: Colors.white),),
                      ),
                    ),
                    if (widget.model.media.isNotEmpty) Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 64,
                        padding: EdgeInsets.symmetric(vertical: offsetXSm),
                        color: Colors.black.withOpacity(0.5),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.model.media.length,
                            itemBuilder: (context, index) {
                          return Container(
                            width: 56,
                            padding: EdgeInsets.all(offsetXSm),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                              child: Stack(
                                children: [
                                  Image.network(widget.model.media[index].imageOriginalUrl,
                                    width: 56, height: 56,
                                    fit: BoxFit.cover,),
                                  index == selectedIndex
                                      ? Container(
                                    child: Center(
                                      child: Icon(Icons.check, color: primaryColor,),
                                    ),
                                  )
                                      : Container(color: primaryColor.withOpacity(0.5),)
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    if (widget.model.ribbon != null) Container(
                      padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
                      decoration: BoxDecoration(
                          color: HexColor.fromHex(widget.model.ribbon.color).withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(offsetBase),
                        )
                      ),
                      child: Text(widget.model.ribbon.text, style: semiBold.copyWith(fontSize: fontBase, color: Colors.white),),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: offsetSm,),
                    Text('Main Information',
                      style: boldText.copyWith(fontSize: fontMd, color: primaryColor),),
                    SizedBox(height: offsetSm,),
                    Row(
                      children: [
                        Text('Price : ', style: lightText.copyWith(fontSize: fontBase),),
                        Text(widget.model.defaultDisplayedPriceFormatted,
                          style: semiBold.copyWith(fontSize: fontMd, color: primaryColor),),
                      ],
                    ),
                    SizedBox(height: offsetSm,),
                    if (widget.model.ribbon != null) Row(
                      children: [
                        Text('Tags : ', style: lightText.copyWith(fontSize: fontBase),),
                        Text(widget.model.ribbon.text,
                          style: semiBold.copyWith(fontSize: fontMd, color: primaryColor),),
                      ],
                    ),
                    SizedBox(height: offsetSm,),
                    Text('Price incl. SGST (₹15.85), CGST (₹15.85)',
                      style: mediumText.copyWith(fontSize: fontMd, color: primaryColor),),
                    SizedBox(height: offsetBase,),
                    if (widget.model.options != null) ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.model.options.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.model.options[index].name,
                                style: semiBold.copyWith(fontSize: fontMd, color: primaryColor),),
                              SizedBox(height: offsetSm,),
                              for (var choice in widget.model.options[index].choices) InkWell(
                                onTap: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    selectedOptions[index] = widget.model.options[index].choices.indexOf(choice);
                                  });
                          },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: offsetXSm),
                                  child: Row(
                                    children: [
                                      widget.model.options[index].choices.indexOf(choice) == selectedOptions[index]
                                        ? Container(
                                        width: 18, height: 18,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: primaryColor, width: 6.0),
                                          borderRadius: BorderRadius.all(Radius.circular(offsetBase)),
                                        ),
                                      )
                                        : Container(
                                        width: 18, height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(offsetBase)),
                                          border: Border.all(color: primaryColor),
                                        ),
                                      ),
                                      SizedBox(width: offsetBase,),
                                      Text(choice.text, style: semiBold.copyWith(fontSize: fontBase),),
                                      if (choice.priceModifier != 0) Text(' (-₹${choice.priceModifier})',
                                        style: mediumText.copyWith(fontSize: fontBase),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                    ),
                    SizedBox(height: offsetBase,),
                    Text('Amount',
                      style: boldText.copyWith(fontSize: fontMd, color: primaryColor),),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.add_circle, color: primaryColor,), onPressed: () {
                          changeAmount(isAdd: true);
                        }),
                        SizedBox(width: offsetSm,),
                        Expanded(
                          child: UnderLineTextField(
                            hint: 'Amount',
                            keyboardType: TextInputType.number,
                            controller: amountController,
                          ),
                        ),
                        SizedBox(width: offsetSm,),
                        IconButton(icon: Icon(Icons.remove_circle, color: primaryColor,), onPressed: () {
                          changeAmount(isAdd: false);
                        }),
                      ],
                    ),
                    SizedBox(height: offsetSm,),
                    Divider(),
                    SizedBox(height: offsetSm,),
                    Row(
                      children: [
                        Text('Save this product',
                          style: boldText.copyWith(fontSize: fontMd, color: primaryColor),),
                        SizedBox(width: offsetBase,),
                        Expanded(
                          child: FullWidthButton(
                            title: 'Add Favorite',
                            color: greenColor,
                            action: () {

                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: offsetLg,),
                    FullWidthButton(
                      title: 'Add to Bag',
                      action: () {
                        addCart();
                      },
                    ),
                    SizedBox(height: offsetBase,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeAmount({bool isAdd = false}) {
    String number = amountController.text;
    int amount = int.parse(number);
    if (isAdd) {
      amount = amount + 1;
    } else {
      if (amount > 1) {
        amount = amount - 1;
      }
    }
    setState(() {
      amountController.text = '$amount';
    });
  }

  addCart() async {
    ProductAmountModel amountModel = ProductAmountModel(
      productID: widget.model.id,
      amount: int.parse(amountController.text),
      selectedOption: selectedIndex ?? 0
    );
    if (cartModels.contains(widget.model) && cartAmountModels.contains(amountModel)) {
      DialogService(context).showSnackbar('This product already saved on your bag.',
          _scaffoldKey,
          type: SnackBarType.WARING);
      return;
    }
    cartModels.add(widget.model);
    cartAmountModels.add(amountModel);
    await PreferenceService().saveCartProducts(cartModels);
    await PreferenceService().saveCartAmount(cartAmountModels);
    DialogService(context).showSnackbar('This product saved on your bag.', _scaffoldKey);

    setState(() {});
  }

}
