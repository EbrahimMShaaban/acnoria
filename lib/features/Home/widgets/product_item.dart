import 'dart:async';

import 'package:acnoria/features/Favourite/cubit/cubit.dart';
import 'package:acnoria/features/Favourite/cubit/state.dart';
import 'package:acnoria/features/home/itemScreen.dart';
import 'package:acnoria/models/addFav_model.dart' as fav;
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/allFavorites_model.dart';
import '../../../models/customproducts_model.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
    required this.model,
    required this.index,
    Key? key,
    required this.favorites,
  }) : super(key: key);
  CustomProductsModel model;
  List<FavItem>? favorites;
  int index;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isfav = false;

  // allFavouriteModel?.data?.any((element) => element.product.id) != null
  //     ? isfav = true
  //     : isfav = false;

  AllFavouritesModel? allFavouriteModel;

  // StreamSubscription? streamSubscription;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      print("initi");
      isfav = (widget.favorites ?? []).any(
        (item) => item.product?.id == widget.model.data![widget.index].id!,
      );

      setState(() {});

      // streamSubscription =
      //     context.read<FavouritesCubit>().stream.listen((state) {
      //   print('emit new state $state');
      //   if (state is FavouritesSuccessState) {
      //     allFavouriteModel = FavouritesCubit.get(context)?.allFavouritesModel;
      //
      //     isfav = allFavouriteModel!.data!.any((item) =>
      //         item.product?.id == widget.model.data![widget.index].id!);
      //     print(isfav);
      //     setState(() {});
      //   }
      // });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, right: 2, left: 2),
        padding: const EdgeInsets.all(7),
        width: MediaQueryHelper.sizeFromWidth(context, 2.6),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.grey,
        ),
        child: InkWell(
          onTap: () {
            navigateTo(context,
                ItemScreen(urlkey: widget.model.data![widget.index].urlKey));
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      FavouritesCubit.get(context)
                          ?.addFavourite(widget.model.data![widget.index].id!);

                      isfav = !isfav;

                      setState(() {});
                    },
                    child: isfav
                        ? Icon(Icons.favorite_outlined)
                        : Icon(Icons.favorite_border),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          '${widget.model.data![widget.index].reviews?.averageRating}',
                          style: const TextStyle(
                              color: AppColors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.gold,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQueryHelper.sizeFromHeight(context, 8),
                child: Image.network(
                  '${widget.model.data![widget.index].baseImage?.originalImageUrl}',
                  errorBuilder: (context, object, stack) {
                    return const Center(
                      child: Text('لا توجد صورة لعرضها'),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 45,
                child: Text('${widget.model.data![widget.index].name}',
                    maxLines: 2,
                    style: AppTextStyles.smTitles
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${widget.model.data![widget.index].price} ر.س ',
                        style: AppTextStyles.smTitles.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 20,
                        color: AppColors.primarycolor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
