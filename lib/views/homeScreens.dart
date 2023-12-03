import 'package:alemenoproject/constants.dart';
import 'package:alemenoproject/provider/provider.dart';
import 'package:alemenoproject/views/my_cart.dart';
import 'package:alemenoproject/widgets/itemcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var varp = Provider.of<VarProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30.h,
          backgroundColor: Colors.white,
          bottomOpacity: 0,
          centerTitle: true,
          //  shadowColor: Colors.white,
          elevation: 0,
          title: Text(
            "LOGO",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: const Color(0xff303030)),
          ),
          actions: [
            // varp.card.length!=0?
            Text(
              '${varp.card?.length}',
              style: const TextStyle(color: Color(color1)),
            ),
            //:SizedBox(),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const MyCart()));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color(0xff10217D),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            // height: 728.h,
            width: 375.w,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20.w, right: 9.w, top: 16.h, bottom: 0),
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular lab tests",
                        style: TextStyle(
                            //  height: 1.8,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: const Color(0xff10217D)),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "View more",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Color(color1),
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Rank(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Rank(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Popular Packages",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: const Color(color1)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    width: 278.w,
                    height: 260.h,
                    // padding: EdgeInsets.only(left: 26.w),
                    margin: EdgeInsets.only(left: 18.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffDBDDE0)),
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 60.h,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(4, 128, 237, 0.2),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(60.r, 60.r))),
                                child: Image.asset("assets/medicine.png"),
                              ),
                              Container(
                                height: 18.h,
                                width: 53.w,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(22, 194, 213, 1),
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset("assets/tick.png"),
                                      Text(
                                        "Safe",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp),
                                      )
                                    ]),
                              )
                              // Image.asset("")
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Text(
                            "Full body checkup",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          const Text(
                            "Includes 92 tests \n Blood Glucose Fasting \n Liver Function Test \nView more",
                            style: TextStyle(
                                color: Color.fromRGBO(108, 135, 174, 1)),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹ 2000/-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                      color: const Color(0xff1BA9B5))),
                              Container(
                                width: 114.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(color1)),
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Center(
                                    child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: const Color(color1)),
                                )),
                              )
                            ],
                          ),
                          // SizedBox(height: 14.h)
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row Rank() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ItemCard(
          name: "Thyroid Profile",
          oldPrice: 1400,
          newPrice: 1000,
          noOfTest: 3,
        ),
        ItemCard(
          name: "Iron Study Test",
          oldPrice: 1000,
          newPrice: 600,
          noOfTest: 4,
        )
      ],
    );
  }
}
