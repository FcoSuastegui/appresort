import 'package:appresort/app/data/models/post_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final Function onShared;
  final GlobalKey postKey;

  const PostItem({
    @required this.post,
    Key key,
    this.onShared,
    this.postKey,
  })  : assert(post != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RepaintBoundary(
      key: postKey,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: CachedNetworkImage(
                        imageUrl: "${GetStorages.i.server}/${post.avatar}",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      post.desarrollo,
                      style: textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
            post.imagen != null
                ? CachedNetworkImage(
                    width: Adapt.screenWidth,
                    height: Adapt.screenWidth / 2,
                    fit: BoxFit.cover,
                    imageUrl: "${GetStorages.i.server}/${post.imagen}",
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.contenido,
                    style: textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: Adapt.px(30),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${post.fechaPublicacion}',
                        style: textTheme.bodyText2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            onTap: onShared,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
