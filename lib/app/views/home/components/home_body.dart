import 'package:appresort/app/data/models/actions_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/home/controllers/home_controller.dart';
import 'package:appresort/app/widgets/Cards/card_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
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
                color: Colors.black.withOpacity(0.9),
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
              children: List.generate(getListActions().length, (index) {
                final action = getListActions()[index];
                return CardService(action: action);
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

  List<ActionsModel> getListActions() => [
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
          title: 'balances'.tr,
          icon: MyIcons.name(
            name: 'balance_scale',
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
}

class _CardBalance extends StatelessWidget {
  const _CardBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find<HomeController>();
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Adapt.px(10),
              horizontal: Adapt.px(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "current-balance".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => c.getCharge(),
                  child: Icon(
                    Icons.replay,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Adapt.px(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => c.loading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 0.5,
                        )
                      : Text(
                          "\$ ${c.total}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
