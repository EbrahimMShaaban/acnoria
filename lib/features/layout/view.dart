import 'package:acnoria/controller/layout/cubit.dart';
import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              body: cubit
                  .screen[cubit
                  .currentIndex],

              bottomNavigationBar: BottomNavigationBar(

                currentIndex: cubit.currentIndex,
                selectedItemColor: AppColors.blueDark,
                unselectedItemColor: AppColors.primarycolor,
                type: BottomNavigationBarType.fixed,

                onTap: (int index){
                  cubit.changeBottomNav(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                ],
              ));
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
