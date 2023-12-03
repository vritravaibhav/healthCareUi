import 'package:alemenoproject/constants.dart';
import 'package:alemenoproject/provider/provider.dart';
import 'package:alemenoproject/widgets/appoint_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    super.initState();
  }

  DateTime val = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final varp = Provider.of<VarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Appointment",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: Color(0xff303030)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2025),
              onDateChanged: (DateTime value) {
                varp.val = value;
                varp.statechanged();
              },
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              "Select time",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: Color(color1)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointTime(time: 8),
                AppointTime(time: 9),
                AppointTime(time: 10),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointTime(time: 11),
                AppointTime(time: 12),
                AppointTime(time: 1),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointTime(time: 2),
                AppointTime(time: 3),
                AppointTime(time: 4),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointTime(time: 5),
                AppointTime(time: 6),
                AppointTime(time: 7),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 330.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Color(color1),
                    borderRadius: BorderRadius.circular(7.r)),
                child: Center(
                    child: Text(
                  "Confirm",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
