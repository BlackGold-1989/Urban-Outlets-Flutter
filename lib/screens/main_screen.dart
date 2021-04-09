import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urban_outlets/generated/l10n.dart';
import 'package:urban_outlets/screens/main/catergory_screen.dart';
import 'package:urban_outlets/screens/main/favorite_screen.dart';
import 'package:urban_outlets/screens/main/order_screen.dart';
import 'package:urban_outlets/screens/main/profile_screen.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/shadow_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var _screens = <int, Widget Function()>{
    0: () => CategoryScreen(),
    1: () => FavoriteScreen(),
    2: () => OrderScreen(),
    3: () => ProfileScreen(),
  };

  var selectedIndex = 0;

  Color getColor(int index) {
    return index == selectedIndex? primaryColor : Colors.grey.withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    var bottomItems = [
      {
        'icon': 'assets/icons/ic_category.svg',
        'title': S.of(context).category,
      },
      {
        'icon': 'assets/icons/ic_favorite.svg',
        'title': S.of(context).favorite,
      },
      {
        'icon': 'assets/icons/ic_order.svg',
        'title': S.of(context).orders,
      },
      {
        'icon': 'assets/icons/ic_profile.svg',
        'title': S.of(context).profile,
      },
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _screens[selectedIndex](),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60.0,
                margin: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetBase),
                padding: EdgeInsets.symmetric(horizontal: offsetBase),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [containerShadow()]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var item in bottomItems) InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = bottomItems.indexOf(item);
                        });
                      },
                      child: Column(
                        children: [
                          Spacer(),
                          SvgPicture.asset(item['icon'], color: getColor(bottomItems.indexOf(item)),),
                          SizedBox(height: offsetXSm,),
                          Text(item['title'], style: mediumText.copyWith(
                              fontSize: fontXSm,
                              color: getColor(bottomItems.indexOf(item))),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
