import 'package:flutter/material.dart';

import '../../../common/resources/colors.dart';
import '../../../common/resources/dimen.dart';
import '../../../common/resources/styles.dart';
import '../../../common/widget/common_appbar.dart';
import '../../../common/widget/common_widget.dart';

class TabLiveCasino extends StatefulWidget {
  const TabLiveCasino({Key? key}) : super(key: key);

  @override
  _TabLiveCasinoState createState() => _TabLiveCasinoState();
}

class _TabLiveCasinoState extends State<TabLiveCasino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMainLayout,
    );
  }

  get getMainLayout => SafeArea(
    child: Column(
          children: [
            getHeaderBar,
            spacingVerticalJUMBO150,
            const Text("Tab Live Casino"),
          ],
        ),
  );

  get getHeaderBar => CommonAppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.card_giftcard,
              color: KAColors.primaryColor,
              size: 30,
            ),
            spacingVerticalXxSmall3,
            Text(
              "Promotions",
              style: TextStyles.small.copyWith(color: KAColors.primaryColor),
            ),
          ],
        ),
        optional: Container(
          height: Spacing.jumbo80,
          width: Spacing.jumbo80,
          color: KAColors.primaryColor,
          child: Center(
            child: Text(
              "Login",
              style: TextStyles.large.copyWith(color: KAColors.whiteColor),
            ),
          ),
        ),
      );
}
