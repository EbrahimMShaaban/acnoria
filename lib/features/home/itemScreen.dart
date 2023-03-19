import 'package:acnoria/features/cart/cubit/Cart_cubit.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/models/customproducts_model.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../models/cart_details_model.dart';
import '../../models/custom_item_model.dart';
import '../../models/product_model.dart';
import '../../shared/styles/images.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({required this.urlkey, Key? key}) : super(key: key);
  String? urlkey;

  // const ItemScreen({Key? key, required this.product, required this.index})
  //     : super(key: key);
  // final Product product;
  // final int index;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int count = 1;
  bool favoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getAllProducts('${widget.urlkey}'),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              AppImages.basket,
              height: 30,
              color: AppColors.primarycolor,
            ),
            onPressed: () {
              navigateTo(context, CartScreen());
            },
          ),
          actions: [
            Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_backspace_sharp,
                  ),
                ))
          ],
        ),
        body: SizedBox(
          height: MediaQueryHelper.sizeFromHeight(context, 1),
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              CustemItemModel? customProductsModel =
                  CartCubit.get(context).product;
              return state is! GetAllProductstLoadingtState
                  ? SingleChildScrollView(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.yellowAccent,
                                  height: MediaQueryHelper.sizeFromHeight(
                                      context, 3),
                                  // width: MediaQueryHelper.sizeFromWidth(context, 2),
                                  child: Image.network(
                                    '${customProductsModel?.data!.baseImage?.largeImageUrl}',
                                    // height: MediaQueryHelper.sizeFromHeight(context, 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35.0),
                                      topRight: Radius.circular(35.0))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 36, vertical: 20),
                              margin: EdgeInsets.only(
                                top: MediaQueryHelper.sizeFromHeight(
                                    context, 2.5),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                                child: Text(
                                                  '${customProductsModel?.data!.shortDescription}',
                                                  maxLines: 2,
                                                  style: AppTextStyles
                                                      .boldtitles
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  favoriteIcon = !favoriteIcon;
                                                });
                                              },
                                              child: favoriteIcon == true
                                                  ? Icon(
                                                      Icons.favorite,
                                                      size: 30,
                                                      color: AppColors
                                                          .primarycolor,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border,
                                                      size: 30,
                                                      color: AppColors
                                                          .primarycolor,
                                                    ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // Text(
                                        //   "– وردي – 4 غ",
                                        //   style: AppTextStyles.boldtitles
                                        //       .copyWith(
                                        //           color: AppColors.blueDark,
                                        //           fontSize: 15),
                                        // ),
                                        // SizedBox(
                                        //   height: 15,
                                        // ),
                                        Text(
                                          '${customProductsModel?.data!.description}',
                                          style: AppTextStyles.smTitles.apply(
                                              color: AppColors.greyDark,
                                              fontSizeDelta: -8),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${customProductsModel?.data!.price} ر.س ',
                                              style: AppTextStyles.boldtitles
                                                  .apply(
                                                      color: AppColors.blue,
                                                      fontSizeDelta: 0),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '${customProductsModel?.data!.formatedPrice}',
                                              style: AppTextStyles.boldtitles
                                                  .apply(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: AppColors.green,
                                                      fontSizeDelta: -5),
                                            ),
                                            Spacer(),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 30.0),
                                              // padding: const EdgeInsets.all(10.0),
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.blue,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        10.0) //         <--- border radius here
                                                    ),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          count++;
                                                        });
                                                      },
                                                      child: Icon(Icons.add)),
                                                  Text(
                                                    "${count}",
                                                    style: AppTextStyles
                                                        .boldtitles
                                                        .copyWith(
                                                            fontSize: 20,
                                                            height: 0,
                                                            color:
                                                                AppColors.blue),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (count > 1)
                                                        setState(() {
                                                          count--;
                                                        });
                                                    },
                                                    child: Icon(Icons.remove),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ]),
                                  BlocConsumer<CartCubit, CartState>(
                                    listener: (context, state) {
                                      print(state);
                                      // TODO: implement listener
                                    },
                                    builder: (context, state) {
                                      CustemItemModel? customProductsModel =
                                          CartCubit.get(context).product;



                                      return state is AddCartLoadingtState
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: FittedBox(
                                                  child: ButtonTemplate(
                                                      icon: Icons
                                                          .add_circle_outline_rounded,
                                                      color: AppColors
                                                          .primarycolor,
                                                      text1: " اضف الى السلة",
                                                      onPressed: () {
                                                        CartCubit.get(context)
                                                            .AddCart(context:context ,
                                                                product_id:
                                                                    customProductsModel
                                                                        ?.data!
                                                                        .id,
                                                                quantity:
                                                                    count);

                                                      }),
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}

/*
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/images.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int count = 1;
  bool favoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            AppImages.basket,
            height: MediaQueryHelper.sizeFromHeight(context, 22),
            color: AppColors.primarycolor,
          ),
          onPressed: () {
            navigateTo(context, CartScreen());
          },
        ),
        actions: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_backspace_sharp,
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                      height: MediaQueryHelper.sizeFromHeight(context, 2.9),
                      child: Image.asset(
                        "assets/images/item.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ])),
          Expanded(
            child: Container(
              height: MediaQueryHelper.sizeFromHeight(context, 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 30),
              // margin: EdgeInsets.only(
              //   top: MediaQueryHelper.sizeFromHeight(context, 2.5),
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أوه ماي تنت مرطب شفاه وملمع ",
                          style: AppTextStyles.boldtitles,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              favoriteIcon = !favoriteIcon;
                            });
                          },
                          icon: favoriteIcon == true
                              ? Icon(
                            Icons.favorite,
                            size: 30,
                            color: AppColors.primarycolor,
                          )
                              : Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: AppColors.primarycolor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "– وردي – 4 غ",
                      style: AppTextStyles.boldtitles
                          .copyWith(color: AppColors.blueDark, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ",
                      style: AppTextStyles.smTitles
                          .apply(color: AppColors.greyDark, fontSizeDelta: -5),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "55 ر.س ",
                            style: AppTextStyles.boldtitles
                                .apply(color: AppColors.blue, fontSizeDelta: 5),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "75 ر.س ",
                            style: AppTextStyles.boldtitles.apply(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.green,
                                fontSizeDelta: -2),
                          ),
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            // padding: const EdgeInsets.all(10.0),
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: AppColors.blue, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                Text(
                                  "${count}",
                                  style: AppTextStyles.boldtitles,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (count > 1)
                                      setState(() {
                                        count--;
                                      });
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ButtonTemplate(
                                minwidth: double.infinity,
                                icon: Icons.add_circle_outline_rounded,
                                color: AppColors.primarycolor,
                                text1: " اضف الى السلة",
                                onPressed: () {
                                  navigateTo(context, CartScreen());
                                }),
                          ),
                        ]),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
*/
