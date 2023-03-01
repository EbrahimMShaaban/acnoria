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
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        4,
        (index) => Container(
              margin: EdgeInsets.only(left: 5),
              child: Center(
                  child: Image.asset(
                AppImages.indicator,
              )),
            ));
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 3),
                padding: EdgeInsets.all(MediaQueryHelper.sizeFromWidth(context, 18)),
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
                        ),
                      ),
                ],
                      ),
                      SizedBox(height: MediaQueryHelper.sizeFromHeight(context, 15),)

                    ],
                  ),
                ),
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
              SizedBox(height: 10),
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

                        // ButtonTemplate(
                        //     color: AppColors.primarycolor,
                        //     text1: 'مشاهدة الجميع',
                        //     fontSize: 15,
                        //     minheight: 30,
                        //
                        //     minwidth: 30,
                        //     onPressed: (){
                        //       navigateTo(context, Categories());
                        //     })
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {
                              navigateTo(context, Categories());
                            },
                            child: const Text('مشاهدة الجميع'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primarycolor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQueryHelper.sizeFromHeight(context, 50),
                    ),
                    Container(
                      height: MediaQueryHelper.sizeFromHeight(context, 3.1),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQueryHelper.sizeFromWidth(context, 2.4),
                          height: 110,
                          child: PageView.builder(
                            controller: controller,
                            // itemCount: pages.length,
                            itemBuilder: (_, index) {
                              return pages[index % pages.length];
                            },
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'اجدد العروض!',
                                style: AppTextStyles.smTitles.copyWith(
                                    color: AppColors.green, fontSize: 18),
                              ),
                              Text(
                                'ايسنس ماسكارا لاش',
                                style: AppTextStyles.lrTitles.copyWith(
                                    color: AppColors.primarycolor,
                                    fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primarycolor),
                                  onPressed: () {},
                                  child: Text(
                                    'اشتري اآن',
                                    style: AppTextStyles.lrTitles
                                        .copyWith(fontSize: 18),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                            controller: controller,
                            count: pages.length,
                            effect: ScrollingDotsEffect(
                                radius: 8,
                                spacing: 2,
                                dotHeight: 7,
                                dotWidth: 7,
                                activeDotColor: AppColors.green,
                                dotColor: AppColors.grey)),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
