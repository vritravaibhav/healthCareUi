import 'package:alemenoproject/constants.dart';
import 'package:alemenoproject/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final int oldPrice;
  final int newPrice;
  final noOfTest;
  const ItemCard(
      {super.key,
      required this.name,
      required this.oldPrice,
      required this.newPrice,
      this.noOfTest = 4});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool added = false;
  String x = "Add to Cart";
  @override
  Widget build(BuildContext context) {
    var varp = Provider.of<VarProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: const Color(color1), width: 0.5),
      ),
      width: 140.w,
      height: 175.h,
      child: Column(
        children: [
          Container(
            height: 32.h,
            width: 140.w,
            color: const Color.fromRGBO(16, 33, 125, 0.8),
            child: Center(
              child: Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 14.w, right: 7.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Includes ${widget.noOfTest} Tests",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            color: const Color(0xff475569)),
                      ),
                      Container(
                        height: 24.h,
                        width: 27.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff16C2D5),
                        ),
                        child: Image.asset("assets/tick.png"),
                      ),
                    ]),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Get reports in 24 hours",
                  style: TextStyle(
                      color: const Color(0xff475569),
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "₹ ${widget.newPrice}",
                        style: TextStyle(
                            //height: 14.h,

                            color: const Color(color1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                          text: " ${widget.oldPrice}",
                          style: TextStyle(
                              //height: 14.h,

                              color: const Color(0xff475569),
                              fontSize: 6.5.sp,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    if (added) {
                      return;
                    }
                    x = "Added to cart";
                    added = true;
                    ItemCard cart = ItemCard(
                        name: widget.name,
                        oldPrice: widget.oldPrice,
                        newPrice: widget.newPrice);
                    varp.card?.add(cart);

                    print(varp.card?.length);
                    varp.statechanged();
                    setState(() {});
                  },
                  child: Container(
                    width: 115.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                        color: added ? const Color(0xff16C2D5) : const Color(color1),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                        child: Text(
                      !added ? "Add to cart" : "Added to cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 8.sp),
                    )),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  width: 115.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    // color: Color(color1),
                    //border: ,
                    //  border:,
                    border: Border.all(color: const Color(color1), width: 0.5),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "View details",
                    style: TextStyle(
                        color: const Color(color1),
                        fontWeight: FontWeight.w700,
                        fontSize: 8.sp),
                  )),
                )
                // Text(
                //   "₹ $oldPrice",
                //   style: TextStyle(
                //       //height: 14.h,

                //       color: Color(0xff475569),
                //       fontSize: 6.5.sp,
                //       fontWeight: FontWeight.w500),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
