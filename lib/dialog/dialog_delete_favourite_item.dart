import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/controller/search_controller.dart';
import 'package:provider/provider.dart';

import '../controller/favourite_controller.dart';
import '../utilities/global/app_global.dart';
import '../utilities/style/colors.dart';
import '../utilities/style/text_style.dart';
import '../widget/button/custom_botton_with_icon_without_background.dart';

Future<void> onPopDeleteFavouriteItem({String? imdbID, String? text, void Function()? onPressed}) {
  return showGeneralDialog(
      context: NavigatorApp.navigatorKey.currentState!.context,
      barrierLabel: "ccc",
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        FavouriteController favouriteController =
        context.watch<FavouriteController>();
PageSearchController pageSearchController=context.watch<PageSearchController>();


        return CupertinoAlertDialog(
          insetAnimationCurve: Curves.bounceInOut,
          title: Icon(CupertinoIcons.delete, color: CustomColor.primaryColor),
          content: Text(text ?? "Are you sure you want to delete this product?",
              style: CustomTextStyle()
                  .rubik
                  .copyWith(color: Colors.black54, fontSize: 12.sp)),
          actions: [
            CustomButtonWithIconWithoutBackground(
                text: "Delete",
                textIcon: "",
                height: 16.h,
                textStyle: CustomTextStyle()
                    .rubik
                    .copyWith(color: CustomColor.primaryColor, fontSize: 11.sp),
                onPressed: onPressed ??
                        () async {
                      await favouriteController.deleteItemMovie(
                          imdbID: (imdbID));
                      await pageSearchController.changeIsFavourite(
                          (imdbID.toString()), false);
                      NavigatorApp.pop();
                    }),
            CustomButtonWithIconWithoutBackground(
                text: "back",
                textIcon: "",
                height: 16.h,
                textStyle: CustomTextStyle()
                    .rubik
                    .copyWith(color: Colors.black, fontSize: 11.sp),
                onPressed: () async {
                  Navigator.pop(context);
                })
          ],
        );
      });
}
