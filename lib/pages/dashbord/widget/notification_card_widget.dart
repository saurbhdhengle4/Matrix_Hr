import 'package:flutter/material.dart';
import 'package:web_dashboard_matrix/common/app_colors.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16, color: AppColor.black),
                  children: const [
                    TextSpan(text: "Good Morning "),
                    TextSpan(
                      text: "Ravi Patel!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Today you have 9 New Applications.\nAlso you need to hire 2 new UX Designers. 1\nReact Native Developer",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Read More",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          if (MediaQuery.of(context).size.width >= 620) ...{
            //img delete
            const Spacer(),
            Image.asset(
              "assets/notification_image.png",
              height: 160,
            )
          }
        ],
      ),
    );
  }
}
