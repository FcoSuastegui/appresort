import 'package:appresort/app/helpers/get_storage.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 0, top: 0),
              padding: EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  GetStorages.inst.avatar,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white, // border color
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.white.withOpacity(.2),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 0.0, left: 10.0),
                    child: Text(
                      GetStorages.inst.nombreCompleto,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppTheme.kTextColor,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      GetStorages.inst.correo,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppTheme.kTextColor,
                        fontSize: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
