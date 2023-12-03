import 'package:alemenoproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PathologyTest extends StatelessWidget {
  final String name;
  final int newPrice;
  final int oldPrice;
  const PathologyTest({
    super.key,
    required this.name,
    required this.newPrice,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 175.h,
      decoration: BoxDecoration(
          //color: Colors.
          border: Border.all(color: const Color(0xffDBDDE0)),
          borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          Container(
            width: 334.w,
            height: 39.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 33, 125, 0.8),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "Pathology tests",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
              ),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color.fromRGBO(15, 23, 42, 1)),
                    ),
                    // Text(
                    //   "₹ 1000/-",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 16.sp,
                    //       color: Color(0xff1BA9B5)),
                    // ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "$newPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xff1BA9B5))),
                      TextSpan(
                          text: "\n $oldPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color(0xff5B5B5B)))
                    ])),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 34.h,
                  width: 129.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                          color: const Color(
                            color1,
                          ),
                          width: 2)),
                  child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Color(color1),
                        ),
                        Text(
                          "Remove",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: const Color(color1)),
                        )
                      ]),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 34.h,
                  width: 281.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                          color: const Color(
                            color1,
                          ),
                          width: 2)),
                  child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.upload,
                          color: Color(color1),
                        ),
                        Text(
                          "Upload prescription (optional)",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: const Color(color1)),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
