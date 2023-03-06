import 'package:acnoria/controller/layout/cubit.dart';
import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/layout/widgets/bottom_item.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              color: AppColors.grey,
              shape: CircularNotchedRectangle(),
              notchMargin: 5,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10,left: 10,right:10),
                  height: MediaQueryHelper.sizeFromHeight(context, 9),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomItem(
                        onclick: () {
                          cubit.changeBottomNav(0);
                        },
                        // width: cubit.currentIndex == 0
                        //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                        //     : MediaQueryHelper.sizeFromWidth(context, 15),
                        path: cubit.currentIndex == 0
                            ? AppImages.x
                            : AppImages.x,
                        heigh: cubit.currentIndex == 0 ? 2 : 0,

                        color: cubit.currentIndex == 0
                            ? AppColors.primarycolor
                            : AppColors.blueDark,
                      ),
                      BottomItem(
                        onclick: () {
                          cubit.changeBottomNav(1);
                        },
                        // width: cubit.currentIndex == 1
                        //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                        //     : MediaQueryHelper.sizeFromWidth(context, 15),
                        path: cubit.currentIndex == 1
                            ? AppImages.x
                            : AppImages.x,
                        heigh: cubit.currentIndex == 1 ? 2 : 0,
                        color: cubit.currentIndex == 1
                            ? AppColors.primarycolor
                            : AppColors.blueDark,
                      ),
                      BottomItem(
                        onclick: () {
                          cubit.changeBottomNav(2);
                        },
                        // width: cubit.currentIndex == 2
                        //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                        //     : MediaQueryHelper.sizeFromWidth(context, 15),
                        path: cubit.currentIndex == 2
                            ? AppImages.x
                            : AppImages.x,
                        heigh: cubit.currentIndex == 2 ? 2 : 0,
                        color: cubit.currentIndex == 2
                            ? AppColors.primarycolor
                            : AppColors.blueDark,
                      ),
                      BottomItem(
                        onclick: () {
                          cubit.changeBottomNav(3);
                        },
                        // width: cubit.currentIndex == 3
                        //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                        //     : MediaQueryHelper.sizeFromWidth(context, 15),
                        path: cubit.currentIndex == 3
                            ? AppImages.x
                            : AppImages.x,
                        heigh: cubit.currentIndex == 3 ? 2 : 0,
                        color: cubit.currentIndex == 3
                            ? AppColors.primarycolor
                            : AppColors.blueDark,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
