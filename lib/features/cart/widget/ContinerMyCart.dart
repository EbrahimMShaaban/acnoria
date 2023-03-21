import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContinerMyCart extends StatefulWidget {
  const ContinerMyCart(
    context, {
    required this.image,
    required this.quantity,
    required this.price,
    required this.title,
    this.add,
    this.remove, this.removeitem,
  });

  final String image;
  final int quantity;
  final String price;
  final Function()? add;
  final Function()? remove;
  final Function()? removeitem;
  final String title;

  @override
  State<ContinerMyCart> createState() => _ContinerMyCartState();
}

class _ContinerMyCartState extends State<ContinerMyCart> {
  @override
  int itemCount = 1;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.09),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 100,
// color: Colors.amber
            child: Center(
              child: Image.network(
                widget.image,
                errorBuilder: (context, obj, tracer) {
                  return Text("لا توجد صورة لعرضها");
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Text(
                  widget.title,
                  maxLines: 2,
                  style: AppTextStyles.textsmbold
                      .copyWith(color: AppColors.blue, height: 0, fontSize: 15),
                ),
              ),
              // Text(
              //   "${widget.quantity}",
              //   style: AppTextStyles.hittext.copyWith(
              //     color: AppColors.green,
              //   ),

              // ),
              SizedBox(height: 9),

              Text(
                widget.price,
                style: AppTextStyles.textsmbold
                    .copyWith(color: AppColors.blue, height: 0),
              ),
            ],
          ),

          Spacer(),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: widget.removeitem ,child:  Icon(Icons.clear_outlined, size: 18)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // margin: const EdgeInsets.only(left: 20.0),
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.Bluehint,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              10.0) //         <--- border radius here
                          ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: widget.add,
                          child: Icon(
                            Icons.add,
                            color: AppColors.green,
                            size: 15,
                          ),
                        ),
                        Text("${widget.quantity}",
                            style: AppTextStyles.boldtitles.copyWith(
                                color: AppColors.green,
                                height: 0,
                                fontSize: 15)),
                        InkWell(
                          onTap: widget.remove,
                          child: Icon(
                            Icons.remove,
                            color: AppColors.green,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
// Align(
//     alignment: Alignment.topRight,
//     child:
//         IconButton(onPressed: () {}, icon: Icon(Icons.clear_outlined)))
        ],
      ),
    );
  }
}
