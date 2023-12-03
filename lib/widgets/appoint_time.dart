// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alemenoproject/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alemenoproject/constants.dart';
import 'package:provider/provider.dart';

class AppointTime extends StatefulWidget {
  int time;
  AppointTime({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<AppointTime> createState() => _AppointTimeState();
}

class _AppointTimeState extends State<AppointTime> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var varp = Provider.of<VarProvider>(context);
    if (varp.time == widget.time) {
      selected = true;
    } else {
      selected = false;
    }
    return InkWell(
      onTap: () {
        varp.time = widget.time;
        //  selected = true;
        varp.statechanged();
        setState(() {});
      },
      child: Container(
        height: 36.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: selected ? const Color(color1) : Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
                width: 2,
                color: const Color(
                  color1,
                ))),
        child: Center(
          child: Text(
            widget.time <= 7 ? "${widget.time}:00 PM" : "${widget.time}:00 AM",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: !selected ? const Color(0xff303030) : Colors.white),
          ),
        ),
      ),
    );
  }
}
