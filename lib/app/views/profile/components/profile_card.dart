import 'package:appresort/app/helpers/get_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key key}) : super(key: key);

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
                margin: EdgeInsets.only(left: 96.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      GetStorages.inst.nombreCompleto,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(GetStorages.inst.tipoUsuario),
                      subtitle: Text(GetStorages.inst.correo),
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
                GetStorages.inst.avatar,
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
