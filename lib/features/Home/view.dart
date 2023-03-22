import 'package:acnoria/features/Categories/cubit/cubit.dart';
import 'package:acnoria/features/Categories/cubit/state.dart';
import 'package:acnoria/features/Home/cubit/cubit.dart';
import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Home/widgets/product_item.dart';
import 'package:acnoria/features/Home/widgets/slider.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/features/search/categories.dart';
import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/categories_model.dart';
import '../../models/customproducts_model.dart';
import '../../shared/styles/styles.dart';
import '../Categories/CategoriesScreen.dart';
import 'cubit/state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
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
                                  navigateTo(context, Categories());
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
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('وصل حديثا',
                    //         style: AppTextStyles.boldtitles.copyWith(
                    //           color: AppColors.primarycolor,
                    //           fontSize: 18,
                    //         )),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           navigateTo(context, Categories());
                    //         },
                    //         child: const Text('مشاهدة الجميع'),
                    //         style: ElevatedButton.styleFrom(
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius:
                    //                     BorderRadius.all(Radius.circular(10))),
                    //             backgroundColor: AppColors.primarycolor),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // BlocProvider(
                    //   create: (BuildContext context) =>
                    //       HomeCubit()..getAllProducts(isnew: true),
                    //   child: BlocConsumer<HomeCubit, HomeStates>(
                    //     builder: (context, state) {
                    //       CustomProductsModel? product =
                    //           HomeCubit.get(context)?.product;
                    //       return Container(
                    //         margin: const EdgeInsets.symmetric(horizontal: 5),
                    //         height:
                    //             MediaQueryHelper.sizeFromHeight(context, 3.1),
                    //         child: product?.data != null
                    //             ? ListView.separated(
                    //                 scrollDirection: Axis.horizontal,
                    //                 itemBuilder: (context, index) {
                    //                   return ProductItem(
                    //                     model: product,
                    //                     index: index,
                    //                   );
                    //                 },
                    //                 separatorBuilder: (context, x) {
                    //                   return SizedBox(
                    //                     width: MediaQueryHelper.sizeFromWidth(
                    //                         context, 30),
                    //                   );
                    //                 },
                    //                 itemCount: product!.data!.length)
                    //             : Center(child: CircularProgressIndicator()),
                    //       );
                    //     },
                    //     listener: (context, state) {},
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<CategoriesCubit, CategoriesStates>(
                      builder: (context, state) {
                        CategoriesModel? categoriesmodel =
                            CategoriesCubit.get(context)?.categoriesModel;

                        if (state is CategoriesLoadingtState) {
                          return const CircularProgressIndicator();
                        }

                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Image.asset(AppImages.img,
                                      height: 125,
                                      fit: BoxFit.fitWidth,
                                      width: MediaQueryHelper.sizeFromWidth(
                                          context, 1)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            '${categoriesmodel?.data![index].name}',
                                            style: AppTextStyles.boldtitles
                                                .copyWith(
                                              color: AppColors.blue,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            navigateTo(context, Categories());
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              backgroundColor:
                                                  AppColors.primarycolor),
                                          child: const Text('مشاهدة الجميع'),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: MediaQueryHelper.sizeFromHeight(
                                        context, 3.1),
                                    child: BlocProvider(
                                      create: (BuildContext context) =>
                                          HomeCubit()
                                            ..getAllProducts(
                                                id: categoriesmodel!
                                                    .data![index].id!),
                                      child: BlocBuilder<HomeCubit, HomeStates>(
                                        builder: (context, state) {
                                          CustomProductsModel? customproduct =
                                              HomeCubit.get(context)?.product;
                                          return state is! HomeLoadingtState
                                              ? ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ProductItem(
                                                        model: customproduct!,
                                                        index: index);
                                                  },
                                                  separatorBuilder:
                                                      (context, x) {
                                                    return SizedBox(
                                                      width: MediaQueryHelper
                                                          .sizeFromWidth(
                                                              context, 30),
                                                    );
                                                  },
                                                  itemCount: customproduct!
                                                              .data!.length <
                                                          10
                                                      ? customproduct
                                                          .data!.length
                                                      : 10)
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                            itemCount: 5);
                      },
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
