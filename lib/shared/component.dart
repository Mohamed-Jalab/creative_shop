import 'package:creative_shop/screens/cate_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../models/category_model.dart';
import '../screens/widgets/item_card.dart';
import 'constant.dart';

Widget buildTextField({
  TextEditingController? controller,
  String text = '',
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Widget? suffix,
  bool obscure = false,
  IconData? prefixIcon,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    validator: validator,
    keyboardType: keyboardType,
    cursorColor: secondaryColor.withValues(alpha: 0.8),
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      prefixIconColor: WidgetStateColor.resolveWith((states) =>
      states.contains(WidgetState.focused)
          ? secondaryColor
          : Colors.grey),
      suffixIcon: suffix,
      contentPadding: const EdgeInsets.only(left: 20),
      hintText: text,
      hintStyle: const TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
          BorderSide(color: secondaryColor.withValues(alpha: 0.8), width: 1.8)),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   borderSide: BorderSide(color: Colors.grey.withOpacity(.8), width: 1.8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.8), width: 1.8),
      ),
    ),
  );
}

Widget buildCheckbox(String text, {bool value = true}) {
  return CheckboxListTile(
    activeColor: secondaryColor,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    contentPadding: EdgeInsets.zero,
    controlAffinity: ListTileControlAffinity.leading,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    value: value,
    // tristate: true,
    onChanged: (value) {},
    title: Text(
      text,
      style: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );
}

Widget buildBigButton(
    BuildContext context, {
      required Widget child,
      Color? color,
      EdgeInsets? padding,
      double? height,
      required void Function() onPressed,
      BorderRadius? borderRadius,
      double? elevation,
    }) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      highlightColor: whiteColor.withValues(alpha: 0.2),
      splashColor: whiteColor.withValues(alpha: 0.2),
      elevation: elevation,
      padding: padding,
      height: height,
      textColor: whiteColor,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(15)),
      onPressed: onPressed,
      child: child,
    ),
  );
}

Widget buildTextButton(String text, {required void Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: secondaryColor,
    ),
    child: Text(
      text,
      style:
      const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );
}

void message(BuildContext context, String msg, {int longTime = 3}) {
  ToastContext toastContext = ToastContext();
  toastContext.init(context);
  Toast.show(msg, duration: longTime);
}

// Widget pageViewScreen(
//   BuildContext context,
// ) {
//   return Stack(
//     children: [
//       PageView.builder(
//         itemBuilder: (context, index) {
//           return SizedBox(
//             child: pageWithGradient(context, image: "${index + 1}.jpg"),
//           );
//         },
//         itemCount: 3,
//       ),
//     ],
//   );
// }

Widget pageWithGradient(
    BuildContext context, {
      required String image,
      required String title,
      required String subtitle,
    }) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset(
        'asset/images/$image',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withValues(alpha: 0.9),
              primaryColor.withValues(alpha: 0),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Positioned(
        top: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: whiteColor, fontSize: 28, fontFamily: 'Poppins')),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                    color: whiteColor.withValues(alpha: 0.7), fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget buildlistTile(
    BuildContext context, {
      required String imageUrl,
      required String title,
      required String subTitle,
      required int numOfProduct,
    }) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              elevation:0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$$subTitle',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                // IconButton(
                //   splashColor: Colors.black,
                //   color: greyColor2,
                //   iconSize: 16,
                //   splashRadius: 18,
                //   icon: const Icon(Icons.add),
                //   onPressed: () {},
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '$numOfProduct',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // IconButton(
                //   color: greyColor2,
                //   iconSize: 16,
                //   splashRadius: 18,
                //   style: IconButton.styleFrom(),
                //   icon: const Icon(Icons.remove),
                //   onPressed: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
      distance(),
    ],
  );
}

Widget distance() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Divider(),
  );
}

void buildMessage(
    BuildContext context, {
      required String image,
      String title = 'Success!',
      required String subTitle,
      String firstButtonText = 'Continue shopping!',
      required void Function() function,
      required String secondButtonText,
      required void Function() secondButtonFunction,
    }) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        height: 350,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(image, width: 100, height: 100),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Expanded(child: SizedBox()),
            buildBigButton(context,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    firstButtonText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                onPressed: function,
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10)),
            const SizedBox(
              height: 10,
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: secondButtonFunction,
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.grey.withValues(alpha: 0.1);
                      }
                      return Colors.transparent;
                    },
                  ),
                ),
                child: Text(
                  secondButtonText,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget productDetile({
  required Function() removeOnPressed,
  required Function() addOnPressed,
  required Function() onScrollButton,
  required int amountOfProduct,
  required double priceOfProduct,
  required String imageOfProduct,
  required String typeOfProduct,
  required String nameOfProduct,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 75,
              height: 75,
              child: Image.network(
                imageOfProduct,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  typeOfProduct,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      nameOfProduct,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .7,
                      ),
                    ),
                    //const SizedBox(width: 5),
                  ],
                ),
                //const SizedBox(height: 10),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${priceOfProduct.toStringAsFixed(2)} SYP ',
                      style: TextStyle(color: Colors.greenAccent[700]),
                    ),
                    const SizedBox(
                      height: 10,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.black26,
                        width: 8,
                      ),
                    ),
                    TextButton(
                        onPressed: onScrollButton,
                        style: TextButton.styleFrom(
                          foregroundColor: primaryColor,
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          //backgroundColor: Colors.yellow,
                          //textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade600,
                              size: 16,
                            ),
                            const Text(' 4.98'),
                            const Text(
                              '(2.4k)',
                              style: TextStyle(color: Colors.black26),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              TextButton(
                  onPressed: addOnPressed,
                  //padding: EdgeInsets.zero,
                  style: TextButton.styleFrom(
                    foregroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    minimumSize: const Size(24, 24),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.grey,
                  )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '$amountOfProduct',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: removeOnPressed,
                  style: TextButton.styleFrom(
                    foregroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    minimumSize: const Size(24, 24),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ],
    );

Widget itemOfColorList({
  required Color productColor,
  required Color selectedColor,
  required Function() inkwellWork,
}) =>
    InkWell(
      onTap: inkwellWork,
      child: Material(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selectedColor, width: 4),
            color: productColor,
          ),
        ),
      ),
    );

Widget itemOfSizeList({
  required String sizeOfProduct,
  required Color selectedColor,
  required Function() inkwellWork,
}) =>
    InkWell(
      onTap: inkwellWork,
      child: Material(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: selectedColor, width: 4),
              color: Colors.white),
          child: Center(
            child: Text(
              sizeOfProduct,
            ),
          ),
        ),
      ),
    );

Widget nameItem(
    {required Color shadowColor,
      required Color nameColor,
      required String name}) =>
    Container(
      width: 220,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(4, 4)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(-4, -4)),
          ]),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 25,
            color: nameColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );

Widget grid(
    BuildContext context,
    CategoryModel model,
    List<ItemCard> list,
    int index,
    ) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CateScreen(
            index: index,
            title: model.name,
            list: list,
          ),
        ),
      );
    },
    child: Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 160,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black45,
                ),
              ]),
          child: Center(
            child: Container(
              width: 159,
              height: 159,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'asset/images/${model.image}',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          model.name,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontFamily: 'Poppins'),
        ),
      ],
    ),
  );
}

List<ItemCard> listOfCards(int index) {
  if (index == 0) {
    return accessoriesCards;
  } else if (index == 1) {
    return candlesCards;
  } else if (index == 2) {
    return collagesCards;
  } else if (index == 3) {
    return embroideryCards;
  } else if (index == 4) {
    return flowersCards;
  } else if (index == 5) {
    return giftsCards;
  } else if (index == 6) {
    return paperCards;
  } else {
    return raizenCards;
  }
}


