import 'package:acnoria/controller/layout/cubit.dart';
import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/layout/widgets/bottom_item.dart';
import 'package:acnoria/shared/styles/colors.dart';
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
              child: Container(
                height: MediaQueryHelper.sizeFromHeight(context, 10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomItem(
                      onclick: () {
                        cubit.changeBottomNav(0);
                      },
                      // width: cubit.currentIndex == 0
                      //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                      //     : MediaQueryHelper.sizeFromWidth(context, 15),
                      path: cubit.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      heigh: cubit.currentIndex == 0 ? 2 : 0,
                    ),
                    BottomItem(
                      onclick: () {
                        cubit.changeBottomNav(1);
                      },
                      // width: cubit.currentIndex == 1
                      //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                      //     : MediaQueryHelper.sizeFromWidth(context, 15),
                      path: cubit.currentIndex == 1
                          ? Icons.favorite
                          : Icons.favorite_border,
                      heigh: cubit.currentIndex == 1 ? 2 : 0,
                    ),
                    BottomItem(
                      onclick: () {
                        cubit.changeBottomNav(2);
                      },
                      // width: cubit.currentIndex == 2
                      //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                      //     : MediaQueryHelper.sizeFromWidth(context, 15),
                      path: cubit.currentIndex == 2
                          ? Icons.notifications
                          : Icons.notifications_outlined,
                      heigh: cubit.currentIndex == 2 ? 2 : 0,
                    ),
                    BottomItem(
                      onclick: () {
                        cubit.changeBottomNav(3);
                      },
                      // width: cubit.currentIndex == 3
                      //     ? MediaQueryHelper.sizeFromWidth(context, 13)
                      //     : MediaQueryHelper.sizeFromWidth(context, 15),
                      path: cubit.currentIndex == 3
                          ? Icons.person
                          : Icons.person_outline,

                      heigh: cubit.currentIndex == 3 ? 2 : 0,
                    ),
                  ],
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
