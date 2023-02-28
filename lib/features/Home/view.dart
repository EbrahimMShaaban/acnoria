import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Home/widgets/product_item.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/styles.dart';
import '../Categories/CategoriesScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQueryHelper.sizeFromHeight(context, 3),
                    decoration: const BoxDecoration(
                        color: AppColors.primarycolor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        navigateTo(context, CartScreen());
                                      },
                                      color: AppColors.white,
                                      icon: Icon(
                                        Icons.shopping_basket_outlined,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        navigateTo(context, SearchView());
                                      },
                                      color: AppColors.white,
                                      icon: Icon(
                                        Icons.search,
                                        size: 30,
                                      )),
                                ],
                              ),
                              Image.asset(
                                AppImages.pin,
                                color: Colors.white,
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     color: AppColors.white,
                              //     icon: Icon(Icons.panorama_fish_eye)),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQueryHelper.sizeFromHeight(context, 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryBox(
                        color: AppColors.lightred,
                        imgPath: AppImages.discount,
                        txt: 'العروض',
                      ),
                      CategoryBox(
                        color: AppColors.lightgreen,
                        imgPath: AppImages.recent,
                        txt: 'وصل حديثا',
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, CategoriesScrren());
                        },
                        child: CategoryBox(
                          color: AppColors.lightblue,
                          imgPath: AppImages.box,
                          txt: 'الأقسام',
                        ),
                      ),
                      CategoryBox(
                        color: AppColors.lightgreen,
                        imgPath: AppImages.booking,
                        txt: 'طلباتي',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQueryHelper.sizeFromHeight(context, 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('وصل حديثا',
                                style: AppTextStyles.smTitles
                                    .copyWith(color: AppColors.primarycolor)),

                            // Container(
                            //   padding: EdgeInsets.all(5),
                            //   height: 39,
                            //   width: 110,
                            //   decoration: BoxDecoration(
                            //       color: AppColors.primarycolor,
                            //       borderRadius: BorderRadius.circular(15)),
                            //   child: Center(
                            //       child: Text(
                            //         "مشاهدة الجميع",
                            //         style: TextStyle(color: AppColors.white,
                            //             fontSize: 17,
                            //             fontWeight
                            //             :FontWeight.bold),
                            //       )),
                            // )
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('مشاهدة الجميع'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primarycolor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQueryHelper.sizeFromHeight(context, 50),
                        ),
                        Container(
                          height: MediaQueryHelper.sizeFromHeight(context, 3.3),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProductItem();
                              },
                              separatorBuilder: (context, x) {
                                return SizedBox(
                                  width:
                                  MediaQueryHelper.sizeFromWidth(context, 15),
                                );
                              },
                              itemCount: 10),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: MediaQueryHelper.sizeFromHeight(context, 5.2),
                right: MediaQueryHelper.sizeFromWidth(context, 9),
                child: Container(
                  width: MediaQueryHelper.sizeFromWidth(context, 1.3),
                  height: MediaQueryHelper.sizeFromHeight(context, 4.5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
