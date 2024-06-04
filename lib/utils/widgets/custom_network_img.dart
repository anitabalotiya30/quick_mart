import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;

  final double? width, height;
  final BoxFit? fit;

  final bool showDefaultImage;
  final double borderRadius;

  const CustomNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.showDefaultImage = true,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPlaceholder = Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.white,
        child: const ColoredBox(color: Colors.black26));

    return ClipRRect(
        child: SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: url != null || url!.isNotEmpty ? url! : _defaultImg,
        fit: fit,

        placeholder: (_, url) => defaultPlaceholder,

        //error
        errorWidget: (_, url, e) => showDefaultImage

            //default image
            ? CustomNetworkImage(
                url: _defaultImg,
                width: width,
                height: height,
                fit: fit,
                showDefaultImage: false,
                borderRadius: borderRadius,
              )

            //
            : defaultPlaceholder,
      ),
    ));
  }

  String get _defaultImg =>
      'https://img.freepik.com/premium-vector/cartoon-flat-style-drawing-male-photographer-taking-photo-pose-camera-professional-operator-correspondent-man-young-male-with-camera-making-pictures-photo-graphic-design-vector-illustration_620206-4075.jpg';
}
