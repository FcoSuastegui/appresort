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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: "${GetStorages.i.server}/${post.imagen}",
                imageBuilder: (context, image) => Container(
                  height: Adapt.px(380),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        Adapt.px(20),
                      ),
                      topRight: Radius.circular(
                        Adapt.px(20),
                      ),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      width: 0.2,
                      color: Colors.grey,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox.shrink(),
                errorWidget: (context, url, error) => SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.contenido,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: Adapt.px(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Adapt.px(30),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: CachedNetworkImage(
                                imageUrl: "${GetStorages.i.server}/${post.avatar}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.desarrollo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adapt.px(25),
                                  ),
                                ),
                                Text(
                                  '${post.fechaPublicacion}',
                                  style: textTheme.caption,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.black26,
                                ),
                              ),
                              onTap: onShared,
                            ),
                            GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF939BB9),
                                ),
                              ),
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
      ),
    );
  }
}
