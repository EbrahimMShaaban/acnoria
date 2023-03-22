import 'package:acnoria/features/cart/DoneShoppingScreen.dart';
import 'package:acnoria/features/cart/widget/ContainerMyOrder.dart';
import 'package:acnoria/features/location/chandeLocation.dart';
import 'package:acnoria/features/cart/widget/Price.dart';
import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/features/location/cubit/Location_cubit.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/LocationKodel.dart';
import '../../models/cart_details_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../location/addNew_location.dart';
import 'cubit/Cart_cubit.dart';

class CartContaine {
  final String image;
  bool isSelected;

  CartContaine({
    required this.image,
    required this.isSelected,
  });
}

class paymentScreen extends StatefulWidget {
  const paymentScreen({Key? key}) : super(key: key);

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  bool? selector = false;
  bool? isSelected_pay = false;
  int count = 1;
  List<CartContaine>? cartContaine = [];

  @override
  void initState() {
    // TODO: implement initState

    cartContaine?.add(
      CartContaine(image: "assets/images/mastercart.png", isSelected: false),
    );
    cartContaine?.add(
      CartContaine(image: "assets/images/vise.png", isSelected: false),
    );
    cartContaine?.add(
      CartContaine(image: "assets/images/payapple.png", isSelected: false),
    );
    cartContaine?.add(
      CartContaine(image: "assets/images/mada.png", isSelected: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getCart(),
        ),
        BlocProvider(
          create: (context) => LocationCubit()..getLocationId(),
        ),
      ],
      child: Scaffold(
        appBar: ProfileAppBar(context, txt: 'عملية الشراء',navTo: () {
          Navigator.pop(context);
        }),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            CartDetailsModel? cartDetailsModel =
                CartCubit.get(context).cartDetailsModel;
            return state is GetOrderLoadingtState
                ? const Center(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: appPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "عنوان الشحن",
                            style: AppTextStyles.textsmbold.copyWith(
                                height: 0, fontWeight: FontWeight.w900),
                          ),
                          BlocConsumer<LocationCubit, LocationState>(
                            listener: (context, state) {
                              print(state);
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              LocationiDModel? locationiDModel =
                                  LocationCubit.get(context).locationiDModel;
                              return state is GetLocationIdLoadingtState
                                  ? const Center(
                                child: Center(child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                )),
                              )
                                  : Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 30),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      height: 140,
                                      width: MediaQueryHelper.sizeFromWidth(
                                          context, 1),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                             child:    state is GetLocationIdErrorState
                                          ? Column(
                                        children: [

                                          Text("لا يوجد عنوان عليك اضافة عنوان"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ButtonTemplate(
                                            minwidth:
                                            MediaQueryHelper.sizeFromWidth(
                                                context, 1),
                                            minheight: 50,
                                            icon:
                                            Icons.add_circle_outline_rounded,
                                            color: AppColors.primarycolor,
                                            text1: "أضافة عنوان ",
                                            onPressed: () {
                                              navigateTo(
                                                  context, AddNewLocation());
                                            },
                                          ),

                                        ],
                                      )
                                          : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Icon(
                                              Icons.location_on_sharp,
                                              size: 28,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${locationiDModel!.data!.phone}",
                                                style: AppTextStyles.boldtitles
                                                    .apply(
                                                        color: AppColors.blue,
                                                        fontSizeDelta: 0),
                                              ),
                                              Text(
                                                "85 صاري, الخالدية 506 جدة, 23 \n 423 - 8949",
                                                style: AppTextStyles.boldtitles
                                                    .copyWith(
                                                        color: AppColors.green,
                                                        fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              navigateTo(context,
                                                  ChangeLocationScreens());
                                            },
                                            child: Text(
                                              "تغير",
                                              style: AppTextStyles.boldtitles
                                                  .apply(
                                                      color: AppColors.blue,
                                                      fontSizeDelta: 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            padding: EdgeInsets.all(20),
                            height: 70,
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/motsecl.png"),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "يتم التوصيل فى خلال 24 دقيقه",
                                  style: AppTextStyles.boldtitles.apply(
                                      color: AppColors.blue, fontSizeDelta: -5),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "طرق الدفع",
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: 2),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 62,
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: cartContaine?.length,
                              itemBuilder: (context, index) {
                                return ContainerCart(
                                  cartContaine![index],
                                  () {
                                    setState(() {
                                      cartContaine?.forEach((gender) =>
                                          gender.isSelected = false);
                                      cartContaine![index].isSelected = true;

                                      selector =
                                          cartContaine![index].isSelected;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          selector == false ? SizedBox() : PaymentContainer(),
                          Container(
                            margin: EdgeInsets.only(bottom: 30, top: 30),
                            padding: EdgeInsets.all(20),
                            height: 70,
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected_pay = !isSelected_pay!;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: isSelected_pay == true
                                          ? AppColors.primarycolor
                                          : AppColors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: AppColors.blue, width: 1.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "الدفع عند الاستلام",
                                    style: AppTextStyles.boldtitles.apply(
                                        color: AppColors.blue,
                                        fontSizeDelta: -5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "او قسط من خلال تابى",
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: 1),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30, top: 20),
                            // padding: EdgeInsets.all(20),
                            height: 70,
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/tabby.png",
                                    width: 50),
                                Center(
                                  child: Text(
                                    "أو قسمها على 4 دفعات شهرية بقيمة 19.75 SAR",
                                    style: AppTextStyles.boldtitles.apply(
                                        color: AppColors.blue,
                                        fontSizeDelta: -7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "المنتجات",
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: 2),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cartDetailsModel!.data!.items!.length,
                            itemBuilder: (context, index) {
                              return ContainerMyOrder(
                                  cartDetailsModel: cartDetailsModel,
                                  index: index);
                            },
                          ),
                          Price(
                            allPrice:
                                "${cartDetailsModel!.data!.formatedBaseSubTotal}",
                            totalPrice:
                                "${cartDetailsModel.data!.formatedBaseDiscountedSubTotal}",
                            priceRate:
                                "${cartDetailsModel.data!.formatedBaseTaxTotal}",
                          ),
                          ButtonTemplate(
                            minwidth:
                                MediaQueryHelper.sizeFromWidth(context, 1),
                            color: AppColors.primarycolor,
                            text1: " اتمام عملية الشراء",
                            onPressed: () {
                              navigateTo(
                                  context,
                                  DoneShoppingScreen(
                                    cartDetailsModel: cartDetailsModel,
                                  ));
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class ContainerCart extends StatelessWidget {
  final CartContaine _CartContaine;
  final Function()? ontap;

  const ContainerCart(
    this._CartContaine,
    this.ontap,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15),
        height: 60,
        width: 73,
        decoration: BoxDecoration(
          border: Border.all(
              color: _CartContaine.isSelected
                  ? AppColors.green
                  : Color(0x3372BCFA),
              width: 1.0),
          color: _CartContaine.isSelected ? AppColors.white : null,
          borderRadius: BorderRadius.all(
              Radius.circular(15.0) //         <--- border radius here
              ),
        ),
        child: InkWell(
          onTap: () {
            ontap!();
          },
          child: Center(
            child: Image.asset("${_CartContaine.image}", width: 50),
          ),
        ));
  }
}

class PaymentContainer extends StatelessWidget {
  PaymentContainer({Key? key}) : super(key: key);

  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController cvvcontroller = TextEditingController();
  TextEditingController datacontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 15),
      height: 300,
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green, width: 1.0),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0) //         <--- border radius here
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اسم صاحب البطاقة",
            style: AppTextStyles.boldtitles.copyWith(fontSize: 15),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 10),
            child: TextFieldTemplate(
                hintText: "الاسم بالكامل", controller: namecontroller),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "cvv",
                    style: AppTextStyles.boldtitles.copyWith(fontSize: 15),
                  ),
                  Container(
                    width: 130,
                    margin: EdgeInsetsDirectional.only(top: 10),
                    child: TextFieldTemplate(
                        hintText: "0552", controller: cvvcontroller),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تاريخ الانتهاء",
                    style: AppTextStyles.boldtitles.copyWith(fontSize: 15),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 10),
                    width: 130,
                    child: TextFieldTemplate(
                        hintText: "3/2023", controller: datacontroller),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
