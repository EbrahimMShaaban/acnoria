import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Home/widgets/product_item.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/features/search/categories.dart';
import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/styles/styles.dart';
import '../Categories/CategoriesScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      4,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Center(
                  child: Image.asset(
                AppImages.indicator,
                width: 300,
                height: 300,
              )),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Text(
                  'اجدد العروض!',
                  style: AppTextStyles.smTitles
                      .copyWith(color: AppColors.green, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'ايسنس ماسكارا لاش',
                    style: AppTextStyles.lrTitles.copyWith(
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor: AppColors.primarycolor),
                    onPressed: () {},
                    child: Text(
                      'اشتري اآن',
                      style: AppTextStyles.lrTitles.copyWith(fontSize: 14),
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 3.5),
                padding:
                    EdgeInsets.all(MediaQueryHelper.sizeFromWidth(context, 18)),
                decoration: const BoxDecoration(
                    color: AppColors.primarycolor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  navigateTo(context, CartScreen());
                                },
                                color: AppColors.white,
                                icon: Image.asset(
                                  AppImages.basket,
                                  color: Colors.white,
                                  height: 25,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  navigateTo(context, SearchView());
                                },
                                color: AppColors.white,
                                icon: Image.asset(
                                  AppImages.search,
                                  color: Colors.white,
                                  height: 25,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              navigateTo(context, SearchView());
                            },
                            color: AppColors.white,
                            icon: Image.asset(
                              AppImages.pin,
                              color: Colors.white,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQueryHelper.sizeFromHeight(context, 15),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQueryHelper.sizeFromHeight(context, 10),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
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
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('وصل حديثا',
                            style: AppTextStyles.boldtitles.copyWith(
                              color: AppColors.primarycolor,
                              fontSize: 18,

                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {
                              navigateTo(context, Categories());
                            },
                            child: const Text('مشاهدة الجميع'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                backgroundColor: AppColors.primarycolor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQueryHelper.sizeFromHeight(context, 3.1),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductItem(colorPath: "assets/images/gym.png",);
                          },
                          separatorBuilder: (context, x) {
                            return SizedBox(
                              width:
                                  MediaQueryHelper.sizeFromWidth(context, 30),
                            );
                          },
                          itemCount: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(AppImages.img,
                        width: MediaQueryHelper.sizeFromWidth(context, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المكملات الغذائية',
                            style: AppTextStyles.boldtitles.copyWith(
                              color: AppColors.blue,
                              fontSize: 18,
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {
                              navigateTo(context, Categories());
                            },
                            child: const Text('مشاهدة الجميع'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                backgroundColor: AppColors.primarycolor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQueryHelper.sizeFromHeight(context, 3.1),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductItem(colorPath: AppImages.food,);
                          },
                          separatorBuilder: (context, x) {
                            return SizedBox(
                              width:
                                  MediaQueryHelper.sizeFromWidth(context, 30),
                            );
                          },
                          itemCount: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(AppImages.img,
                        width: MediaQueryHelper.sizeFromWidth(context, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('العطور',
                            style: AppTextStyles.boldtitles.copyWith(
                              color: AppColors.blue,
                              fontSize: 18,
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {
                              navigateTo(context, Categories());
                            },
                            child: const Text('مشاهدة الجميع'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                backgroundColor: AppColors.primarycolor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQueryHelper.sizeFromHeight(context, 3.1),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductItem(colorPath: AppImages.barvan,);
                          },
                          separatorBuilder: (context, x) {
                            return SizedBox(
                              width:
                              MediaQueryHelper.sizeFromWidth(context, 30),
                            );
                          },
                          itemCount: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: MediaQueryHelper.sizeFromHeight(context, 6.5),
            left: 40,
            right: 40,
            // right: MediaQueryHelper.sizeFromWidth(context, 9),
            child: Container(
                width: MediaQuery.of(context).size.width,
                // width: 200,
                height: 150,
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 120,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: pages.length,
                        itemBuilder: (_, index) {
                          return pages[index % pages.length];
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: const ScrollingDotsEffect(
                            radius: 8,
                            spacing: 2,
                            dotHeight: 7,
                            dotWidth: 7,
                            activeDotColor: AppColors.green,
                            dotColor: AppColors.grey))
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
