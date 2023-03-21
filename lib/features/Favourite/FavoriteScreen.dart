import 'package:acnoria/features/Favourite/cubit/state.dart';
import 'package:acnoria/models/allFavorites_model.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../models/addFav_model.dart';
import '../../models/fav_model/test.dart';
import 'cubit/cubit.dart';
import 'favItem.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesCubit()..getAllfavourites(),
      child: BlocConsumer<FavouritesCubit, FavouritesStates>(
        listener: (context, state) {
          // print(
          //     'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
           print("stateeeeeeeee is  $state");
        },
        builder: (context, state) {

          // AllFavouritesModel? allFavouritesModel =
          //     FavouritesCubit.get(context)?.allFavouritesModel;
          // AddFavouriteModel? addFavouriteModel =
          //     FavouritesCubit.get(context)?.addFavouriteModel;

          //  print("${allFavouritesModel!.data!.length}");
if(state is FavouritesSuccessState) {
  return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: appPadding(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 20),
              child: Text(
                "المفضلة",
                style: AppTextStyles.lrTitles
                    .apply(fontSizeDelta: 5, fontWeightDelta: 200),
              ),
            ),

                 ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ContinerMyFavorite(
                    onPressed: () {
                      FavouritesCubit.get(context)
                          ?.addFavourite(state.allFavouritesModel
                          .data![index].product!.id!);

                        FavouritesCubit.get(context)?.getAllfavourites();
                    },
                    index: index,
                    allFavouritesModel: state.allFavouritesModel,
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 20,
                ),
                itemCount: state.allFavouritesModel.data!.length),

            const SizedBox(
              height: 20,
            ),
            ButtonTemplate(
                minwidth: double.infinity,
                icon: Icons.add_circle_outline_rounded,
                color: AppColors.primarycolor,
                text1: " اضف الى السلة",
                onPressed: () {}),
          ],
        ),
      ),
  );
}return const Center(child: CircularProgressIndicator(),)
              //   : const Center(child: CircularProgressIndicator())
              ;
        },
      ),
    );
  }
}
