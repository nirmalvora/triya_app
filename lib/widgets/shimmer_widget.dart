import 'package:flutter/material.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: height ?? 60,
        width: width ?? 60,
        color: ColorConstant.white,
      ),
      enabled: true,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
