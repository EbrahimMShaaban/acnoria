import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Home/widgets/product_item.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/features/search/categories.dart';
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
  HomeScreen({Key? key}) : super(key: key);
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
        (index) => Container(
          width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Container(
                height: 100,

                child: Center(
                    child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 170,
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
                            style: AppTextStyles.smTitles
                                .copyWith(color: AppColors.green,fontSize: 18),
                          ),
                          Text(
                            'ايسنس ماسكارا لاش',
                            style: AppTextStyles.lrTitles
                                .copyWith(color: AppColors.primarycolor,fontSize: 18),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primarycolor),
                              onPressed: () {},
                              child: Text(
                                'اشتري اآن',
                                style: AppTextStyles.lrTitles.copyWith(fontSize: 18),
                              ))
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
