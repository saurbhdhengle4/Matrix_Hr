import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dashboard_matrix/common/app_colors.dart';
import 'package:web_dashboard_matrix/common/app_responsive.dart';
import 'package:web_dashboard_matrix/controllers/menu_controller.dart';
import 'package:web_dashboard_matrix/pages/dashbord/dashbord.dart';
import 'package:web_dashboard_matrix/pages/widget/side_bar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      drawer: const SideBar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Side nav menu Only show in desktop
          if (AppResponsive.isDesktop(context))
            const Expanded(
              child: SideBar(),
            ),
          //main body part
          const Expanded(
            flex: 4,
            child: Dashboard(),
          ),
        ],
      )),
    );
  }
}
