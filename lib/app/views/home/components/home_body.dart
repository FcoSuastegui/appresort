import 'package:appresort/app/data/models/actions_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends GetView<HomeController> {
  HomeBody({Key key}) : super(key: key);

  final List<ActionsModel> actions = [
    ActionsModel(
      title: 'regulations',
      icon: MyIcons.name(
        name: 'bookmark',
        size: Adapt.px(80),
      ),
      page: '/regulations',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'assemblies',
      icon: MyIcons.name(
        name: 'gavel',
        size: Adapt.px(80),
      ),
      page: '/assemblies',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'balance',
      icon: MyIcons.name(
        name: 'balance-scale',
        size: Adapt.px(80),
      ),
      page: '/balance',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'publications',
      icon: MyIcons.name(
        name: 'photo_album',
        size: Adapt.px(80),
      ),
      page: '/post',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'services',
      icon: MyIcons.name(
        name: 'menu_book',
        size: Adapt.px(80),
      ),
      page: '/services',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'tickets',
      icon: MyIcons.name(
        name: 'support_agent',
        size: Adapt.px(80),
      ),
      page: '/tickets',
    ),
    ActionsModel(
      backGroundColor: Color(0xFFC7DFFC),
      title: 'polls',
      icon: MyIcons.name(
        name: 'live_help',
        size: Adapt.px(80),
      ),
      page: '/polls',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: Adapt.px(30),
        horizontal: Adapt.px(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _CardBalance(),
          SizedBox(
            height: Adapt.px(20),
          ),
          Container(
            child: Text(
              "all-services".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: Adapt.px(25),
          ),
          Container(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.0,
              runSpacing: 10.0,
              children: List.generate(actions.length, (index) {
                final action = actions[index];
                return Tooltip(
                  message: action.title.tr,
                  child: GestureDetector(
                    onTap: () => Routes.goToPage(action.page),
                    child: Container(
                      width: Adapt.px(200),
                      height: Adapt.px(220),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Adapt.px(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7.0,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              action.icon,
                              SizedBox(
                                height: Adapt.px(30),
                              ),
                              Container(
                                child: Text(
                                  action.title.tr,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: Adapt.px(50),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: Adapt.px(250),
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
      ),
    );
  }
}

class _CardBalance extends StatelessWidget {
  const _CardBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Adapt.px(200),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular(10.0),
        ),
        gradient: new LinearGradient(
          colors: [
            AppTheme.kPrimaryColor,
            AppTheme.kPrimaryColor.withOpacity(0.9),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.clamp,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Color(0xFF3C60F8).withOpacity(.2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Adapt.px(40),
          horizontal: Adapt.px(60),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "current-balance".tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: Adapt.px(20),
            ),
            Text(
              "\$ 8, 458.00",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
