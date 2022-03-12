import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/widgets/shimmer_widget.dart';

class ShimmerImage extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String imageUrl;
  final String? errorImage;

  const ShimmerImage(
      {Key? key,
      this.imageHeight = 80,
      this.imageWidth = 80,
      required this.imageUrl,
      this.errorImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.cover,
      placeholder: (context, url) => ShimmerWidget(
        height: imageHeight,
        width: imageWidth,
      ),
      errorWidget: (context, url, error) => Container(
        height: imageHeight,
        width: imageWidth,
        color: ColorConstant.red,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          errorImage ?? "",
          height: imageHeight,
          width: imageWidth,
        ),
      ),
    );
  }
}
