import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/widgets/cache_imageview.dart';

class AppBarCircleAvtar extends StatelessWidget {
  const AppBarCircleAvtar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 20,
        child: ClipOval(
          child: Obx(
            () => CacheImageView(
              imageUrl: AppState.loginData.value?.user?.profilePicture ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
