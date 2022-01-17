import 'package:flutter/material.dart';
import 'package:web_dashboard_matrix/common/app_colors.dart';
import 'package:web_dashboard_matrix/common/app_responsive.dart';
import 'package:web_dashboard_matrix/pages/dashbord/widget/calender_widget.dart';
import 'package:web_dashboard_matrix/pages/dashbord/widget/header_widget.dart';
import 'package:web_dashboard_matrix/pages/dashbord/widget/notification_card_widget.dart';
import 'package:web_dashboard_matrix/pages/dashbord/widget/profile_card_widget.dart';
import 'package:web_dashboard_matrix/pages/dashbord/widget/recruitment_data_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          //header nav part
          const HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Column(
                        children: [
                          const NotificationCardWidget(),
                          const SizedBox(height: 20),
                          if (AppResponsive.isMobile(context)) ...{
                            const CalendarWidget(),
                            const SizedBox(height: 20),
                          },
                          const RecruitmentDataWidget()
                        ],
                      ),
                    ),
                  ),
                  if (!AppResponsive.isMobile(context))
                    Expanded(
                      child: Container(
                        child: Column(
                          children: const [
                            CalendarWidget(),
                            SizedBox(height: 20),
                            ProfileCardWidget(),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
