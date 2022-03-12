import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/image_constant.dart';

class CacheImageView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? subImage;
  final double? subHeight;
  final double? subWidth;

  const CacheImageView(
      {Key? key,
      required this.imageUrl,
      this.height,
      this.width,
      this.fit,
      this.subHeight,
      this.subWidth,
      this.subImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height ?? 210,
      fit: fit ?? BoxFit.cover,
      width: width ?? Get.width,
      placeholder: (context, url) => SizedBox(
        height: subHeight ?? 210,
        width: subWidth ?? 210,
        child: SvgPicture.asset(
          subImage ?? "",
          height: subHeight ?? 210,
          fit: BoxFit.cover,
          width: subWidth ?? Get.width,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: subHeight ?? 210,
        width: subWidth ?? 210,
        child: SvgPicture.asset(
          subImage ?? "",
          height: subHeight ?? 210,
          fit: BoxFit.cover,
          width: subWidth ?? Get.width,
        ),
      ),
    );
  }
}
