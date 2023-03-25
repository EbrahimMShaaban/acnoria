import 'package:acnoria/features/Categories/cubit/cubit.dart';
import 'package:acnoria/features/Categories/cubit/state.dart';
import 'package:acnoria/models/categories_model.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../cart/view.dart';
import '../search/categories.dart';
import '../search/widgets/search_bar.dart';
import 'ContinerCategories.dart';
import 'ContinerCategoriesBackgroundimage.dart';

class CategoriesScrren extends StatelessWidget {
  const CategoriesScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getAllCatefories(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              AppImages.basket,
              height: 33,
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
                  icon: const Icon(
                    Icons.keyboard_backspace_sharp,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: appPadding(),
          child: ListView(children: [
            Text(
              "التصنيفات",
              style: AppTextStyles.boldtitles.apply(
                fontSizeDelta: 10,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQueryHelper.sizeFromHeight(context, 8),
                //  color: Colors.red,
                child: SearchBar()),
          const  SizedBox(
              height: 30,
            ),
           const ContinerCategoriesBackgroundImage(),
            BlocConsumer<CategoriesCubit, CategoriesStates>(
              listener: (context, state) {
                print(state);
              },
              builder: (context, state) {
                CategoriesModel? categoriesmodel =
                    CategoriesCubit.get(context)?.categoriesModel;
                return categoriesmodel == null
                    ?const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return categoriesmodel.data![index].name != null
                              ? InkWell(
                                  onTap: () {
                                    int id =
                                        categoriesmodel.data![index].id ?? 0;
                                    navigateTo(
                                        context,
                                        Categories(
                                          selectedIndex: id,
                                        ));
                                  },
                                  child: ContinerCategories(
                                    name:
                                        '${categoriesmodel.data![index].name}',
                                  ),
                                )
                              : SizedBox();
                        },
                        itemCount: categoriesmodel.data?.length,
                      );
              },
            )
          ]),
        ),
      ),
    );
  }
}
