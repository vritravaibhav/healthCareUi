import 'package:alemenoproject/constants.dart';
import 'package:alemenoproject/provider/provider.dart';
import 'package:alemenoproject/views/appointment.dart';
import 'package:alemenoproject/views/success.dart';
import 'package:alemenoproject/widgets/pathology.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool accept = false;

  void showSnackbar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.red),
      ),
      duration: const Duration(seconds: 2), // You can adjust the duration
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var varp = Provider.of<VarProvider>(context);
    varp.mrpTotal = 0;
    varp.price = 0;
    for (var i = 0; i < varp.card!.length; i++) {
      varp.mrpTotal = varp.card![i].oldPrice + varp.mrpTotal;
      varp.price = varp.card![i].newPrice + varp.price;
      // varp.statechanged();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "My cart",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: const Color(0xff303030)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xff0D99FF),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10.h),
            Text(
              "Order review",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: const Color(color1)),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: varp.card?.length,
                itemBuilder: (BuildContext context, int index) {
                  //  varp.statechanged();
                  //  setState(() {});
                  return PathologyTest(
                    name: varp.card![index].name,
                    newPrice: varp.card![index].newPrice,
                    oldPrice: varp.card![index].oldPrice,
                  );
                }),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                DateTime x;

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AppointmentScreen()));
              },
              child: Container(
                width: 330.w,
                height: 84.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xffDBDDE0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 255.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDBDDE0)),
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Center(
                        heightFactor: 1,
                        widthFactor: 0,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text:
                                  "   ${varp.val!.day}/${varp.val!.month}/${varp.val!.year}  ",
                              style: const TextStyle(
                                  color: Color(color1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                          // SizedBox(width: 4.w,),
                          TextSpan(
                              text: varp.time! <= 7
                                  ? "${varp.time}:00 PM"
                                  : "${varp.time}:00 AM",
                              style: const TextStyle(
                                  color: Color(color1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12))
                        ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15),
              height: 170.h,
              width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: const Color.fromRGBO(219, 221, 224, 1))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "M.R.P Total",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 85, 105, 1)),
                      ),
                      Text(
                        "₹ ${varp.mrpTotal}",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 85, 105, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 85, 105, 1)),
                      ),
                      Text(
                        "₹ ${varp.mrpTotal - varp.price}",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 85, 105, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount to be paid",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(color1)),
                      ),
                      Text(
                        "₹ ${varp.price}/-",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(color1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    //s  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total Savings",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        "₹ ${varp.mrpTotal - varp.price} /-",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(color1)),
                      ),
                      SizedBox(
                        width: 100.w,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 105.h,
              width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: const Color.fromRGBO(234, 236, 240, 1))),
              child: Column(children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        focusColor: Colors.white,
                        activeColor: const Color(color1),
                        // fillColor: Color(color1),
                        value: accept,
                        onChanged: (bool? value) {
                          accept = !accept;
                          setState(() {});
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hard copy of reports",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: const Color(0xff344054)),
                        ),
                        Text(
                          "Reports will be delivered within 3-4 \nworking days. Hard copy charges are non- \nrefundable once the reports have been \ndispatched.\n\n₹150 per person",
                          style: TextStyle(
                              color: const Color(0xff667085),
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
              onTap: () {
                if (accept) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Success()));
                } else {
                  showSnackbar(context, "Mark the checkBox");
                }
              },
              child: Container(
                width: 330.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color(color1),
                    borderRadius: BorderRadius.circular(7.r)),
                child: const Center(
                    child: Text(
                  "Schedule",
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
