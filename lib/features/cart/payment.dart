import 'package:acnoria/features/cart/DoneShoppingScreen.dart';
import 'package:acnoria/features/cart/chandeLocation.dart';
import 'package:acnoria/features/cart/widget/Price.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

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
  TextEditingController namecontroller = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(right: 36.0),
          child: Text("عملية الشراء",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeFactor: 1.5)),
        ),
        actions: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_backspace_sharp,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
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
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.all(20),
                height: 150,
                width: MediaQueryHelper.sizeFromWidth(context, 1),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الرياض , السعودية",
                          style: AppTextStyles.boldtitles
                              .apply(color: AppColors.blue, fontSizeDelta: 3),
                        ),
                        Text(
                          "85 صاري, الخالدية 506 جدة, 23 \n 423 - 8949",
                          style: AppTextStyles.boldtitles
                              .apply(color: AppColors.green, fontSizeDelta: -4),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        navigateTo(context, ChangeLocationScreens());
                      },
                      child: Text(
                        "تغير",
                        style: AppTextStyles.boldtitles
                            .apply(color: AppColors.blue, fontSizeDelta: 3),
                      ),
                    ),
                  ],
                ),
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
                      style: AppTextStyles.boldtitles
                          .apply(color: AppColors.blue, fontSizeDelta: -3),
                    ),
                  ],
                ),
              ),
              Text(
                "طرق الدفع",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
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
                          cartContaine
                              ?.forEach((gender) => gender.isSelected = false);
                          cartContaine![index].isSelected = true;

                          selector = cartContaine![index].isSelected;
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              selector == false
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(left: 15),
                      height: 300,
                      width: MediaQueryHelper.sizeFromWidth(context, 1),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.green, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //         <--- border radius here
                            ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "اسم صاحب البطاقة",
                            style: AppTextStyles.boldtitles,
                          ),
                          TextFieldTemplate(
                              hintText: "الاسم بالكامل",
                              controller: namecontroller),
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
                                    style: AppTextStyles.boldtitles,
                                  ),
                                  Container(
                                    width: 130,
                                    child: TextFieldTemplate(
                                        hintText: "0552",
                                        controller: namecontroller),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "تاريخ الانتهاء",
                                    style: AppTextStyles.boldtitles,
                                  ),
                                  Container(
                                    width: 130,
                                    child: TextFieldTemplate(
                                        hintText: "3/2023",
                                        controller: namecontroller),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          border: Border.all(color: AppColors.blue, width: 1.0),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "الدفع عند الاستلام",
                        style: AppTextStyles.boldtitles
                            .apply(color: AppColors.blue, fontSizeDelta: -2),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "او قسط من خلال تابى",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
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
                    Image.asset("assets/images/tabby.png", width: 50),
                    Center(
                      child: Text(
                        "أو قسمها على 4 دفعات شهرية بقيمة 19.75 SAR",
                        style: AppTextStyles.boldtitles
                            .apply(color: AppColors.blue, fontSizeDelta: -7),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "المنتجات",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20),
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                height: 120,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.09),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                width: MediaQueryHelper.sizeFromWidth(context, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
// color: Colors.amber
                      child: Image.asset(
                        "assets/images/item.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أوه ماي تنت",
                          style: AppTextStyles.boldtitles
                              .apply(color: AppColors.blue, fontSizeDelta: 2),
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "السعر :  ",
                                style: AppTextStyles.boldtitles
                                    .apply(color: AppColors.primarycolor),
                              ),
                              TextSpan(
                                text: "55 ر.س ",
                                style: AppTextStyles.smTitles
                                    .apply(color: AppColors.green),
                              ),
                            ])),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "الكمية :  ",
                                style: AppTextStyles.boldtitles
                                    .apply(color: AppColors.primarycolor),
                              ),
                              TextSpan(
                                text: "2",
                                style: AppTextStyles.smTitles
                                    .apply(color: AppColors.green),
                              ),
                            ])),
                      ],
                    ),
                  ],
                ),
              ),
              Price(),
              ButtonTemplate(
                minwidth: MediaQueryHelper.sizeFromWidth(context, 1),
                color: AppColors.primarycolor,
                text1: " اتمام عملية الشراء",
                onPressed: () {
                  navigateTo(context, DoneShoppingScreen());
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
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