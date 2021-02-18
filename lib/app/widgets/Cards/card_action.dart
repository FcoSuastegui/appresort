import 'package:appresort/app/data/models/actions_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CardService extends StatelessWidget {
  final ActionsModel action;
  const CardService({
    Key key,
    @required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
