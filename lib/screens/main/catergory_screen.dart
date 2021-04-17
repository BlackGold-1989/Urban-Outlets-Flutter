import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_outlets/generated/l10n.dart';
import 'package:urban_outlets/models/category_model.dart';
import 'package:urban_outlets/screens/product/sub_category_screen.dart';
import 'package:urban_outlets/services/navigator_service.dart';
import 'package:urban_outlets/services/network_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/shadow_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/consts.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';

class CategoryScreen extends StatefulWidget {
  final Function() reload;

  const CategoryScreen({Key key, this.reload}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<CategoryModel> categories = [];
  List<CategoryModel> supCategories = [];
  List<List<CategoryModel>> subCategories = [];

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _getData();
    });
  }

  _getData() async {
    String url = 'categories\?token=$token';
    var resp = await NetworkService(context).ajax(url, isProgress: true);
    categories.clear();
    for (var json in resp['items']) {
      CategoryModel model  = CategoryModel.fromMap(json);
      categories.add(model);
    }
    supCategories.clear();
    for (var category in categories) {
      if (category.parentId == 0) {
        supCategories.add(category);
      }
    }
    subCategories.clear();
    for (var sup in supCategories) {
      List<CategoryModel> subs = [];
      for (var category in categories) {
        if (sup.id == category.parentId) {
          subs.add(category);
        }
      }
      subCategories.add(subs);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: S.of(context).category,
        titleIcon: Container(
          padding: EdgeInsets.all(offsetBase),
            child: SvgPicture.asset('assets/icons/ic_category.svg', color: primaryColor,)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
          child: Column(
            children: [
              SizedBox(height: offsetBase,),
              Text('Feature Products', style: boldText.copyWith(fontSize: fontLg,
                  color: Colors.blueGrey,),),
              Container(
                margin: EdgeInsets.symmetric(vertical: offsetBase),
                height: MediaQuery.of(context).size.width * 0.4,
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: offsetXSm,
                mainAxisSpacing: offsetXSm,
                childAspectRatio: 5 / 7,
                children:
                List<Widget>.generate(supCategories.length, (index) {
                  return InkWell(
                    onTap: () {
                      NavigatorService(context).pushToWidget(screen: SubCategoryScreen(
                        models: subCategories[index],
                        imageUrl: supCategories[index].imageUrl,
                        categoryName: supCategories[index].name,
                      ), pop: (value) {
                        widget.reload();
                      });
                    },
                    child: Card(
                      shadowColor: getColor(index % 10).withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(offsetBase))
                      ),
                      elevation: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(offsetBase)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AspectRatio(
                                aspectRatio: 5 / 4,
                              child: Image.network(supCategories[index].thumbnailUrl, fit: BoxFit.cover,),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(offsetBase),
                                decoration: BoxDecoration(
                                    gradient: getGradientColor(color: getColor(index % 10))
                                ),
                                child: Column(
                                  children: [
                                    Text(supCategories[index].name,
                                      style: boldText.copyWith(fontSize: fontMd,
                                          color: Colors.white,
                                          shadows: [containerShadow(shadowColor: Colors.black, offsetX: 1, offsetY: 1)]),
                                      textAlign: TextAlign.center,),
                                    SizedBox(height: offsetSm,),
                                    Text('Sub Categories: ${subCategories[index].length}',
                                      style: mediumText.copyWith(fontSize: fontSm,
                                        color: Colors.white,
                                      ),),
                                    Text('Products: ${supCategories[index].productCount}',
                                      style: mediumText.copyWith(fontSize: fontSm,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                ),
              ),
              SizedBox(height: 75.0,),
            ],
          ),
        ),
      ),
    );
  }
}
