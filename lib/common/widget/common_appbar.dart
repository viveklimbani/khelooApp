import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kheloo/common/resources/images.dart';

import '../resources/colors.dart';
import '../resources/dimen.dart';
import '../resources/styles.dart';
import 'common_widget.dart';

class CommonAppBar extends StatelessWidget {
  Widget? leading;
  Widget? title;
  Widget? optional;
  CommonAppBar({Key? key, this.leading, this.title, this.optional})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.jumbo80,
      padding: const EdgeInsets.only(left: Spacing.large),
      decoration: const BoxDecoration(color: KAColors.primaryDarkBlueColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///todo: replace leading with SVG
          InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: leading ??
                Image.asset(
                  Images.icSplashLogo,
                ),
          ),
          spacingHorizontalLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              title ?? const Text("Home screen"),
              spacingHorizontalNormal,
              optional ?? Container(),
            ],
          ),
        ],
      ),
    );
  }
}
