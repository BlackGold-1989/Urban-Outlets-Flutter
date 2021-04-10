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
  final String title;
  final List<CategoryModel> models;

  const SubCategoryScreen({
    Key key,
    this.title,
    this.models
  }) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: widget.title,
      ),
      body: Container(
        padding: EdgeInsets.only(top: offsetSm),
        child: ListView.builder(
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
                        SvgPicture.asset('assets/images/logo.svg', height: 36.0,),
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
      ),
    );
  }
}
