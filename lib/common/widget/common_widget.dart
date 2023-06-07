import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../di/di_service.dart';
import '../resources/colors.dart';
import '../resources/dimen.dart';
import '../resources/styles.dart';
import '../utils/enum.dart';


Logger logger = getIt.get<Logger>();

Widget circularScreenLoader({double height = 40}) {
  return Center(
    child: SizedBox(
      height: height,
      width: height,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    ),
  );
}

showCustomToast(
    {required String? text, ToastType toastType = ToastType.Success}) {
  Color backgroundColor;

  switch (toastType) {
    case ToastType.Success:
      backgroundColor = KAColors.primary;
      break;
    case ToastType.Error:
      backgroundColor = KAColors.alertRedColor;
      break;
  }

  // if (kReleaseMode) return;

  BotToast.showCustomText(
    toastBuilder: (CancelFunc cancel) => Align(
      alignment: Alignment.topCenter,
      child: Material(
        child: Container(
          color: backgroundColor,
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: Spacing.xSmall),
                child: Text(
                  text ?? "",
                  style:
                      TextStyles.small.copyWith(color: KAColors.whiteColor),
                ),
              )),
              IconButton(
                onPressed: () => cancel(),
                icon: const Icon(
                  Icons.close,
                  color: KAColors.whiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    ),
    duration:
        Duration(milliseconds: toastType == ToastType.Success ? 1500 : 2000),
    animationDuration: const Duration(milliseconds: 400),
    onlyOne: true,
  );
}

get spacingVerticalSmall => const SizedBox(
      height: Spacing.small,
    );

get spacingVerticalSmall13 => const SizedBox(
      height: Spacing.small13,
    );

get spacingVerticalNormal14 => const SizedBox(
      height: Spacing.normal14,
    );

get spacingVerticalNormal => const SizedBox(
      height: Spacing.normal,
    );

get spacingVerticalXNormal => const SizedBox(
      height: Spacing.xNormal,
    );

get spacingVerticalXSmall => const SizedBox(
      height: Spacing.xSmall,
    );

get spacingVerticalXxSmall3 => const SizedBox(
      height: Spacing.xxSmall3,
    );

get spacingVerticalXxSmall => const SizedBox(
      height: Spacing.xxSmall,
    );

get spacingVerticalSpace6 => const SizedBox(
      height: Spacing.space6,
    );

get spacingVerticalXxxSmall1 => const SizedBox(
      height: Spacing.xxxSmall1,
    );

get spacingVerticalXxxSmall => const SizedBox(
      height: Spacing.xxxSmall,
    );

get spacingVerticalSize15 => const SizedBox(
      height: Spacing.size15,
    );

get spacingVerticalXSmall10 => const SizedBox(
      height: Spacing.xSmall10,
    );

get spacingVerticalXLarge => const SizedBox(
      height: Spacing.xLarge,
    );

get spacingVerticalJUMBO30 => const SizedBox(
      height: Spacing.jumbo30,
    );

get spacingVerticalJUMBO50 => const SizedBox(
      height: Spacing.jumbo50,
    );

get spacingVerticalJUMBO60 => const SizedBox(
      height: Spacing.jumbo60,
    );

get spacingVerticalJUMBO40 => const SizedBox(
      height: Spacing.jumbo40,
    );

get spacingVerticalJUMBO80 => const SizedBox(
      height: Spacing.jumbo80,
    );

get spacingVerticalJUMBO90 => const SizedBox(
      height: Spacing.jumbo90,
    );

get spacingVerticalJUMBO150 => const SizedBox(
      height: Spacing.jumbo150,
    );

get spacingVerticalXXLarge => const SizedBox(
      height: Spacing.xxLarge,
    );

get spacingVerticalXXXLarge => const SizedBox(
      height: Spacing.xxxLarge,
    );

get spacingVerticalLarge => const SizedBox(
      height: Spacing.large,
    );

get spacingHorizontalSmall => const SizedBox(
      width: Spacing.small,
    );

get spacingHorizontalSpace5 => const SizedBox(
      width: Spacing.xxSmall5,
    );

get spacingHorizontalSpace6 => const SizedBox(
      width: Spacing.space6,
    );

get spacingHorizontalNormal => const SizedBox(
      width: Spacing.normal,
    );

get spacingHorizontalNormal14 => const SizedBox(
      width: Spacing.normal14,
    );

get spacingHorizontalXNormal => const SizedBox(
      width: Spacing.xNormal,
    );

get spacingHorizontalXSmall => const SizedBox(
      width: Spacing.xSmall,
    );

get spacingHorizontalXSmall10 => const SizedBox(
      width: Spacing.xSmall10,
    );

get spacingHorizontalXxSmall5 => const SizedBox(
      width: Spacing.xxSmall5,
    );

get spacingHorizontalXxSmall => const SizedBox(
      width: Spacing.xxSmall,
    );

get spacingHorizontalXxxSmall => const SizedBox(
      width: Spacing.xxxSmall,
    );

get spacingHorizontalXLarge => const SizedBox(
      width: Spacing.xLarge,
    );

get spacingHorizontalXxLarge => const SizedBox(
      width: Spacing.xxLarge,
    );

get spacingHorizontalXxxLarge => const SizedBox(
      width: Spacing.xxxLarge,
    );

get spacingHorizontalLarge => const SizedBox(
      width: Spacing.large,
    );
