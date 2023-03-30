import 'package:flutter/material.dart';
import 'package:meddeliver/utils/context_extension.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

import '../utils/constant_images.dart';
import 'home_page.dart';

// ignore: constant_identifier_names
enum Pages { HOME, DETAIL, HEALTH, PROFILE }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Pages currentPage = Pages.HOME;

  Widget currentPageWidget() {
    switch (currentPage) {
      case Pages.HOME:
        return const HomePage();
      case Pages.PROFILE:
        return const Center(child: Text("Profile Page"));
      case Pages.HEALTH:
        return const Center(child: Text("Health Page"));
      default:
        return const Text("no page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.white, Colors.green, Colors.green[900]!],
            iconTheme: const IconThemeData(size: 32, color: Colors.black45),
            activeIconTheme: IconThemeData(size: 36, color: Colors.green[900]),
            elevation: 2.0,
            items: [
              pageButtonItem(icon: Icons.home, page: Pages.HOME),
              pageButtonItem(
                  icon: Icons.text_snippet_outlined, page: Pages.DETAIL),
              pageButtonItem(icon: Icons.favorite_border, page: Pages.HEALTH),
              pageButtonItem(icon: Icons.person, page: Pages.PROFILE),
            ],
            actionButtonDetails: SCActionButtonDetails(
              color: Colors.green,
              icon: const Icon(Icons.add),
              elevation: 2,
            ),
            circleItems: [
              circleItem(Icons.qr_code_2_outlined),
              circleItem(Icons.message),
            ],
            bnbHeight: context.screenHeight * 0.08,
          ),
          child: currentPageWidget(),
        ),
      ),
    );
  }

  Icon darkGreenIcon(IconData iconData) =>
      Icon(iconData, color: Colors.green[800]);

  SCItem circleItem(IconData iconData) =>
      SCItem(icon: darkGreenIcon(iconData), onPressed: () {});

  SCBottomBarItem pageButtonItem({
    IconData icon = Icons.numbers,
    Pages page = Pages.HOME,
  }) =>
      SCBottomBarItem(
        icon: icon,
        onPressed: () {
          setState(() {
            currentPage = page;
          });
        },
      );

  Widget circleAvatarWidget() => CircleAvatar(
        child: Image.network(ConstantImages.getInstance().profilePictureHint),
      );
}
