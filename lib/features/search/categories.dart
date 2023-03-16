import 'package:acnoria/features/Categories/cubit/cubit.dart';
import 'package:acnoria/features/Categories/cubit/state.dart';
import 'package:acnoria/features/search/cubit/cubit.dart';
import 'package:acnoria/features/search/cubit/state.dart';
import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categories_model.dart';
import '../../models/customproducts_model.dart';
import '../../models/product_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../../shared/styles/styles.dart';
import '../Home/widgets/product_item.dart';
import 'filteration.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit()..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getAllCatefories(),
        ),
      ],
      child: Scaffold(
        appBar: AppSearchBar(context),
        body: Padding(
          padding: appPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQueryHelper.sizeFromHeight(context, 8),
                  //  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(context, SearchView());
                        },
                        child: Container(
                            width: MediaQueryHelper.sizeFromWidth(context, 1.6),
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Image.asset(
                                    AppImages.search,
                                    color: Colors.grey,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  'بحث',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, FilterAtion());
                        },
                        child: Container(
                          height: MediaQueryHelper.sizeFromWidth(context, 9),
                          width: MediaQueryHelper.sizeFromWidth(context, 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(AppImages.filter),
                          ),
                        ),
                      )
                    ],
                  )),
              BlocConsumer<CategoriesCubit, CategoriesStates>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  CategoriesModel? categoriesmodel =
                      CategoriesCubit.get(context)?.categoriesModel;
                  return categoriesmodel == null
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return categoriesmodel.data![index].name != null? TextButton(
                                  onPressed: () {

                                  },
                                  child: Text(
                                      '${categoriesmodel.data?[index].name}',
                                      style: AppTextStyles.smTitles.copyWith(
                                          color: AppColors.primarycolor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900)),
                                ):const SizedBox();
                              },
                              itemCount: categoriesmodel.data!.length),
                        );
                },
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     TextButton(
              //       onPressed: () {},
              //       child: Text('العطور',
              //           style: AppTextStyles.smTitles.copyWith(
              //               color: AppColors.primarycolor,
              //               fontSize: 18,
              //               fontWeight: FontWeight.w900)),
              //     ),
              //     TextButton(
              //         onPressed: () {},
              //         child: Text('الاسنان',
              //             style: AppTextStyles.smTitles.copyWith(
              //               color: AppColors.primarycolor,
              //               fontSize: 18,
              //             ))),
              //     TextButton(
              //         onPressed: () {},
              //         child: Text('عدسات',
              //             style: AppTextStyles.smTitles.copyWith(
              //               color: AppColors.primarycolor,
              //               fontSize: 18,
              //             ))),
              //     TextButton(
              //         onPressed: () {},
              //         child: Text('مكملات غذائية',
              //             style: AppTextStyles.smTitles.copyWith(
              //               color: AppColors.primarycolor,
              //               fontSize: 18,
              //             ))),
              //   ],
              // ),
              Expanded(
                child: BlocConsumer<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    CustomProductsModel? product = SearchCubit.get(context)?.product;
                    return product?.data != null
                        ? GridView.builder(
                            // shrinkWrap: true,
                            //  physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.65,
                                    crossAxisSpacing: 8,
                                    crossAxisCount: 2),
                            itemCount: product?.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(
                                  'product length in ui is ${product?.data?.length}');
                              return ProductItem(
                                model: product!,
                                index: index,
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                  listener: (context, state) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
