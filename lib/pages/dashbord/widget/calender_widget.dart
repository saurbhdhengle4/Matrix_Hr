import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web_dashboard_matrix/common/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
//pick now month and year than show
                DateFormat("MMM, yyyy").format(_focusedDay),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
//change  month and year than show
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month - 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColor.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month + 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColor.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010), //firstDay
            lastDay: DateTime.utc(2040), //lastDay
            headerVisible: false, //header (means today date and weeks)
            onFormatChanged: (format) {},
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EEE").format(date).toUpperCase();
              },
              weekendStyle: const TextStyle(fontWeight: FontWeight.bold),
              weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPageChanged: (day) {
              _focusedDay = day;
              setState(() {});
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColor.yellow,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: AppColor.yellow,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (day) {
              //make events on 22 and 12 date every month
              if (day.day == 22 || day.day == 12) {
                return [Event("Event Name", canBubble: true)];
              }
              return [];
            },
          ),
        ],
      ),
    );
  }
}
