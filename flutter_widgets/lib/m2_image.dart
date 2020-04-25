import 'package:flutter/material.dart';

//import 'package:connected_ui/connected_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class M2Image extends StatelessWidget {
  final String imageUrl;

  M2Image({
    Key key,
    @required this.imageUrl,
  })  : assert(imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
          child: Icon(
            null, //这个null没办法，原来引用的是
            key: Key('m2image_placeholder_icon'),
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
