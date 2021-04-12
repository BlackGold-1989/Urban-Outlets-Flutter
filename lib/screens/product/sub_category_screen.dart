import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_outlets/models/category_model.dart';
import 'package:urban_outlets/screens/product/product_list_screen.dart';
import 'package:urban_outlets/services/navigator_service.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';

class SubCategoryScreen extends StatefulWidget {
  final List<CategoryModel> models;
  final String imageUrl;
  final String categoryName;

  const SubCategoryScreen({
    Key key,
    this.models,
    this.imageUrl,
    this.categoryName,
  }) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: widget.categoryName,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 8 / 5,
              child: widget.imageUrl != null
                  ? Container(
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover,)
              )
                  : SvgPicture.asset('assets/images/logo.svg', fit: BoxFit.contain,),
            ),
            SizedBox(height: offsetBase,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.models.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        NavigatorService(context).pushToWidget(screen: ProductListScreen(
                          model: widget.models[index],
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                              child: widget.models[index].thumbnailUrl != null
                                  ? Image.network(widget.models[index].thumbnailUrl, width: 48.0, height: 48.0, fit: BoxFit.cover,)
                                  : SvgPicture.asset('assets/images/logo.svg', height: 48.0,),
                            ),
                            SizedBox(width: offsetBase,),
                            Expanded(child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.models[index].name, style: semiBold.copyWith(fontSize: fontBase, color: Colors.blueGrey),),
                                  SizedBox(height: offsetXSm,),
                                  Text('Products: ${widget.models[index].productCount}', style: mediumText.copyWith(fontSize: fontSm, color: Colors.grey),),
                                ],
                              ),
                            )),
                            Icon(Icons.arrow_right, color: primaryColor,),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
