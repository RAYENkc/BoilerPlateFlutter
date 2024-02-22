import 'package:BolilerPlate/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<String> menuItems;
  final String title;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.menuItems,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.dark(),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: isLargeScreen
            ? null
            : IconButton(
                color: AppColors.primaryColor,
                icon: const Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isLargeScreen) Expanded(child: _buildNavBarItems(context)),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
                backgroundColor: AppColors.primaryColor, child: _ProfileIcon()),
          )
        ],
      ),
    );
  }

  Widget _buildNavBarItems(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: menuItems
            .map(
              (item) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 16,
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.person),
      offset: const Offset(0, 40),
      onSelected: (Menu item) {
        // Handle the selected menu item here
        switch (item) {
          case Menu.itemOne:
            break;
          case Menu.itemTwo:
            // Handle item two tap
            break;
          case Menu.itemThree:
          
            Get.offNamed(AppRoutes.login);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.itemOne,
          child: Text('Account'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemTwo,
          child: Text('Settings'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemThree,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}

enum Menu { itemOne, itemTwo, itemThree }
