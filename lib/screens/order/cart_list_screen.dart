import 'package:flutter/material.dart';
import 'package:urban_outlets/screens/main_screen.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';
import 'package:urban_outlets/widgets/appbar_widget.dart';

class CartListScreen extends StatefulWidget {
  @override
  _CartListScreenState createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBarWidget(
        titleString: 'My Bag',
      ),
      body: cartModels.isEmpty
          ? Center(

      )
          : Column(
            children: [

              Expanded(
                child: ListView.builder(
        itemCount: cartModels.length,
        itemBuilder: (context, index) {
                return Card(
                  shadowColor: primaryColor.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(offsetBase))
                  ),
                  child: Container(
                    padding: EdgeInsets.all(offsetBase),
                  ),
                );
        }
      ),
              ),
            ],
          ),
    );
  }
}
