import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_dashboard_controller.dart';
import 'package:triya_app/ui/deshboard/home/home.dart';
import 'package:triya_app/utils/app_utils.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final controller = Get.put(EmployerDashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: controller.currentIndex.value,
        children: [
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          backgroundColor: Color(0xff1F63C9),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: controller.currentIndex.value,
          items: [
            _buildBottomNavigationItem(icon: "home_icon", tabName: "Home"),
            _buildBottomNavigationItem(
                icon: "favourite_icon", tabName: "Favourite"),
            _buildBottomNavigationItem(icon: "account_icon", tabName: "Account")
          ],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  dynamic _buildBottomNavigationItem(
      {required String icon, required String tabName}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppUtils.getSVGAsset(icon),
        height: 24,
        width: 24,
        color: Colors.grey,
      ),
      activeIcon: SvgPicture.asset(
        AppUtils.getSVGAsset(icon),
        height: 24,
        width: 24,
        color: Colors.white,
      ),
      label: tabName,
    );
  }
}
