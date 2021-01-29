import 'package:appresort/app/data/models/publicacion_model.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/widgets/Cards/card_post.dart';
import 'package:appresort/app/widgets/Cards/card_post_image.dart';
import 'package:flutter/material.dart';

class PublicacionCard extends StatelessWidget {
  final PublicacionModel publicacion;
  final GlobalKey keyPublicacion;
  final Function onTap;
  const PublicacionCard({
    Key key,
    this.publicacion,
    this.keyPublicacion,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return publicacion.tipoMedia == '1'
        ? RepaintBoundary(
            key: keyPublicacion,
            child: CardPostImage(
              image: "${GetStorages.i.server}/${publicacion.imagen}",
              avatar: "${GetStorages.i.server}/${publicacion.avatar}",
              title: publicacion.titulo,
              subtitle: publicacion.desarrollo,
              date: publicacion.fechaPublicacion,
              content: publicacion.contenido,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.share),
                    ),
                    onTap: onTap),
              ],
            ))
        : RepaintBoundary(
            key: keyPublicacion,
            child: CardPost(
              avatar: "${GetStorages.i.server}/${publicacion.avatar}",
              title: publicacion.titulo,
              subtitle: publicacion.desarrollo,
              date: publicacion.fechaPublicacion,
              content: publicacion.contenido,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.share),
                    ),
                    onTap: onTap),
              ],
            ),
          );
  }
}
