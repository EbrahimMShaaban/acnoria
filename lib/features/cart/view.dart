import 'package:acnoria/features/cart/cubit/Cart_cubit.dart';
import 'package:acnoria/features/cart/payment.dart';
import 'package:acnoria/features/cart/widget/ContinerMyCart.dart';
import 'package:acnoria/features/cart/widget/Price.dart';
import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_details_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController codeController = TextEditingController();
  late int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: ProfileAppBar(context, txt: 'السلة'),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
            print(state);
          },
          builder: (context, state) {
            CartDetailsModel? cartDetailsModel =
                CartCubit.get(context).cartDetailsModel;

            return state is GetOrderLoadingtState ||
                    state is RomoveItemFromCardLoadingtState ||
                    state is UpdateCardtLoadingtState
                ? const Center(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: appPadding(),
                      child: state is GetOrdertErrorState
                          ? Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                    "لا يوجد طلبات \n عليك أضافة منتجات",
                                    style: AppTextStyles.boldtitles.copyWith(fontSize: 25)),
                              ))
                          : Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      cartDetailsModel!.data!.items!.length,
                                  itemBuilder: (context, index) {
                                    int? count = cartDetailsModel
                                        .data!.items![index].quantity;
                                    return ContinerMyCart(
                                      context,
                                      removeitem: () {
                                        CartCubit.get(context).romoveItem(
                                            cartDetailsModel
                                                .data!.items![index].id!);
                                      },
                                      add: () {
                                        setState(() {
                                          cartDetailsModel
                                              .data!.items![index].quantity++;

                                          CartCubit.get(context).updateCard(
                                              product_id: cartDetailsModel
                                                  .data!.items![index].id!,
                                              quantity: cartDetailsModel.data!
                                                  .items![index].quantity++);
                                        });
                                      },
                                      remove: () {
                                        setState(() {
                                          if (cartDetailsModel.data!
                                                  .items![index].quantity >
                                              1)
                                            cartDetailsModel
                                                .data!.items![index].quantity--;
                                          CartCubit.get(context).updateCard(
                                              product_id: cartDetailsModel
                                                  .data!.items![index].id!,
                                              quantity: cartDetailsModel.data!
                                                  .items![index].quantity--);
                                        });
                                      },
                                      image:
                                          "${cartDetailsModel.data!.items![index].product!.baseImage!.smallImageUrl}",
                                      title:
                                          "${cartDetailsModel.data!.items![index].product!.name}",
                                      price:
                                          "${cartDetailsModel.data!.items![index].formatedBaseTotal}",
                                      quantity: cartDetailsModel
                                          .data!.items![index].quantity,
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, bottom: 40),
                                  child: TextField(
                                    style: AppTextStyles.lrTitles
                                        .apply(color: AppColors.primarycolor),
                                    decoration: InputDecoration(
                                      hintText: "كود الخصم",
                                      hintStyle: AppTextStyles.textsmbold
                                          .copyWith(
                                              height: 0,
                                              fontWeight: FontWeight.w500),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.primarycolor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      suffixIcon: Container(
                                        margin: EdgeInsets.all(9),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100, 50),
                                            primary: AppColors.primarycolor,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      15.0),
                                            ),
                                          ),
                                          child: Text(
                                            "تطبيق",
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Price(
                                  allPrice:
                                      "${cartDetailsModel.data!.formatedBaseSubTotal}",
                                  totalPrice:
                                      "${cartDetailsModel.data!.formatedBaseDiscountedSubTotal}",
                                  priceRate:
                                      "${cartDetailsModel.data!.formatedBaseTaxTotal}",
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ButtonTemplate(
                                      minwidth: MediaQueryHelper.sizeFromWidth(
                                          context, 2.6),
                                      color: AppColors.primarycolor,
                                      text1: "شراء الان",
                                      onPressed: () {
                                        navigateTo(context, paymentScreen());
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 36),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: MediaQueryHelper.sizeFromWidth(
                                              context, 2.8),
                                          height: 60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.blue,
                                                width: 2.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    10.0) //         <--- border radius here
                                                ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text("اضافة منتجات",
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyles
                                                        .textsmbold
                                                        .copyWith(
                                                      height: 1,
                                                      color: AppColors.blue,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
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
