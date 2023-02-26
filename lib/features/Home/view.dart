import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Home/widgets/product_item.dart';
import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          color: AppColors.white,
                          icon: Icon(Icons.shopping_basket_outlined)),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, SearchView());
                          },
                          color: AppColors.white,
                          icon: Icon(Icons.search)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      color: AppColors.white,
                      icon: Icon(Icons.panorama_fish_eye)),
                ],
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
                CategoryBox(
                  color: AppColors.lightblue,
                  imgPath: AppImages.box,
                  txt: 'الأقسام',
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('وصل حديثا'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('مشاهدة الجميع'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primarycolor),
                      )
                    ],
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
                            width: MediaQueryHelper.sizeFromWidth(context, 15),
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
              borderRadius: BorderRadius.circular(15),
              color: Colors.greenAccent,
            ),
          ),
        )
      ],
    ));
  }
}
