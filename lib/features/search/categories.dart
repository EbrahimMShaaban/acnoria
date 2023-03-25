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

class Categories extends StatefulWidget {
  Categories({Key? key,this.selectedIndex,}) : super(key: key);
  // int
  int? selectedIndex;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getAllCatefories((int id){
            widget.selectedIndex ??= id;
            SearchCubit.get(context)!.getAllProducts(widget.selectedIndex ?? 0);

          }),
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
                              const  Text(
                                  'بحث',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                      ),
                    const  SizedBox(
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
                                return categoriesmodel.data![index].name != null
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            widget.selectedIndex = categoriesmodel
                                                .data![index].id ?? 0;

                                            SearchCubit.get(context)
                                                ?.getAllProducts(widget.selectedIndex ?? 0);
                                          });
                                          // CategoriesCubit.get(context)
                                          //     ?.chngeSelection(index);
                                          print(
                                              'is uiiiiii = ${CategoriesCubit.get(context)!.selectedIndex}');
                                          print('is uiiiiii = ');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Text(
                                              '${categoriesmodel.data?[index].name}',
                                              style: AppTextStyles.smTitles
                                                  .copyWith(
                                                      color: widget
                                                                  .selectedIndex ==
                                                          (categoriesmodel
                                                              .data ?? [])[index].id
                                                          ? AppColors
                                                              .primarycolor
                                                          : AppColors.green,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900)),
                                        ),
                                      )
                                    : const SizedBox();
                              },
                              itemCount: categoriesmodel.data!.length),
                        );
                },
              ),

              ///
              Expanded(
                child: BlocConsumer<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    // return state is!SearchLoadingtState
                    //     ?
                    //     : const Center(child: CircularProgressIndicator());

                    if(state is SearchSuccessState) {
                      CustomProductsModel? product =
                          SearchCubit.get(context)?.product;

                      return GridView.builder(
                      // shrinkWrap: true,
                      //  physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2),
                    itemCount: (product!.data!.length)-1,
                    //  itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                    // SearchCubit.get(context)?.getAllProducts(widget.id);
                    print(
                    'product length in ui is ${product.data?.length}');
                    return ProductItem(
                    model: product,
                    index: index,
                    favorites: [],
                    );
                    },
                    );
                    }

                    return const Center(child: CircularProgressIndicator());
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
