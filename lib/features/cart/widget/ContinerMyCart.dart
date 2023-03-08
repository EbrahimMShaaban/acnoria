import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class ContinerMyCart extends StatefulWidget {
  const ContinerMyCart(
    context, {
    required this.add,
    required this.count,
    required this.remove,
  });

  final int count;
  final Function()? add;
  final Function()? remove;

  @override
  State<ContinerMyCart> createState() => _ContinerMyCartState();
}

class _ContinerMyCartState extends State<ContinerMyCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
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
            width: 80,
// color: Colors.amber
            child: Image.asset(
              "assets/images/item.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "أوه ماي تنت",
                style: AppTextStyles.textsmbold
                    .copyWith(color: AppColors.blue, height: 0),
              ),
              Text(
                "متبقى 3",
                style: AppTextStyles.hittext.copyWith(
                  color: AppColors.green,
                ),
              ),
              Text(
                "55 ر.س",
                style: AppTextStyles.textsmbold
                    .copyWith(color: AppColors.blue, height: 0),
              ),
            ],
          ),

          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.clear_outlined)),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue,),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10.0) //         <--- border radius here
                      ),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(

                     // width: 10,
                      child: IconButton(

                        onPressed: () => widget.add!(),
                        icon: Icon(

                          Icons.add,
                          color: AppColors.green,
                          size: 12,
                        ),
                      ),
                    ),
                    Container(
                      width: 5,
                      child: Text(
                        "${widget.count}",
                        style: AppTextStyles.textsmbold.copyWith(
                          color: AppColors.green,
                          height: 0

                        ),
                      ),
                    ),
                    Container(
                  //    width: 10,
                      child: IconButton(
                        onPressed: () => widget.remove!(),
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.green,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
