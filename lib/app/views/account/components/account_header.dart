import 'package:appresort/app/utils/get_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey[400],
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 95.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      GetStorages.i.user.fullname,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(GetStorages.i.user.user),
                      subtitle: Text(GetStorages.i.user.email),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                GetStorages.i.user.photo,
              ),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.only(left: 16.0),
        ),
      ],
    );
  }
}
