import 'package:alemenoproject/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    var varp = Provider.of<VarProvider>(context);
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
          "Success",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: Color(0xff303030)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Container(
          padding: EdgeInsets.all(4),
          width: 330.w,
          height: 400.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: Color(0xffC6C6C6))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                width: 180.w,
                height: 164.h,
                child: Image.asset("assets/success.png")),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Text(
                "    Lab tests have been scheduled \nsuccessfully, You will receive a mail of \n               the same. ",
                style: TextStyle(
                    color: Color(0xff0F172A),
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              " ${varp.val!.day} / ${varp.val!.month}  |  ${varp.time}:00 ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.grey),
            )
          ]),
        ),
      ),
    );
  }
}
