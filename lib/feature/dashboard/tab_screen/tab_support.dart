import 'package:carousel_slider/carousel_slider.dart';
import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kheloo/common/resources/images.dart';
import 'package:kheloo/common/resources/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/resources/colors.dart';
import '../../../common/resources/dimen.dart';
import '../../../common/widget/common_appbar.dart';
import '../../../common/widget/common_widget.dart';

class TabSupport extends StatefulWidget {
  const TabSupport({Key? key}) : super(key: key);

  @override
  _TabSupportState createState() => _TabSupportState();
}

class _TabSupportState extends State<TabSupport> {
  late YoutubePlayerController _controller;

  int currentPos = 0;
  List<String> listPaths = [
    Images.icBanner1,
    Images.icBanner2,
    Images.icBanner3,
    Images.icBanner4,
  ];
  List langList = [
    "English",
    "हिंदी",
    "தமிழ்",
    "తెలుగు",
    "मराठी",
    "English",
    "हिंदी",
    "தமிழ்",
    "తెలుగు",
    "मराठी",
  ];

  List userList = [
    "Mehar",
    "Anushka",
    "Ira",
    "Vivaan",
  ];

  List<String> listOfGames = [
    Images.icBanner1,
    Images.icBanner2,
    Images.icBanner3,
    Images.icBanner4,
    Images.icBanner1,
    Images.icBanner2,
    Images.icBanner3,
    Images.icBanner4,
  ];

  bool showMore = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '-BYWbosiYlw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KAColors.backgroundColor,
      body: SafeArea(
        child: getMainLayout,
      ),
    );
  }

  get getMainLayout => Column(
        children: [
          getHeaderBar,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getImageCarousel,
                  languageList,
                  spacingVerticalLarge,
                  getJackpotCounter,
                  spacingVerticalLarge,
                  getUserList,
                  spacingVerticalLarge,
                  getVideoLayout,
                  spacingVerticalLarge,
                  getGamesTitle,
                  spacingVerticalLarge,
                  getGridBox(),
                ],
              ),
            ),
          ),
        ],
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

  get getImageCarousel => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: listPaths.length,
            options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            itemBuilder: (context, int index, realIndex) {
              return SizedBox(
                  child: Image.asset(
                listPaths[index],
                fit: BoxFit.fill,
              ));
            },
          ),
          spacingVerticalLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listPaths.map((url) {
              int index = listPaths.indexOf(url);
              return Container(
                width: 25.0,
                height: 3.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: currentPos == index
                      ? KAColors.primaryColor
                      : KAColors.greyColor,
                ),
              );
            }).toList(),
          ),
          spacingVerticalLarge,
        ],
      );

  get languageList => Container(
        height: Spacing.jumbo50,
        color: KAColors.primaryDarkPurpleColor,
        child: ListView.builder(
            itemCount: langList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return getSingleLanList(index);
            }),
      );

  Widget getSingleLanList(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.jumbo25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            langList[index],
            style: TextStyles.large.copyWith(
              color: Colors.orange,
            ),
          ),
          spacingHorizontalNormal,
        ],
      ),
    );
  }

  get getJackpotCounter => Column(
    children: [
      Text(
        "JACKPOT",
        style: TextStyles.xxxLarge.copyWith(
          color: KAColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      Container(
        width: 150,
        height: 3,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: KAColors.primaryColor,
        ),
      ),
      spacingVerticalLarge,
      Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: KAColors.primaryColor,
              border: Border.all(color: KAColors.primaryDarkRedColor, width: 4),
              borderRadius: BorderRadius.circular(RadiusConst.largeBox),
            ),
            child: Countup(
                prefix: "₹",
                begin: 0,
                end: 75000000,
                duration: const Duration(seconds: 10),
                separator: ',',
                style: TextStyles.xxxLarge
                    .copyWith(color: KAColors.primaryDarkRedColor)),
          ),
    ],
  );

  get getUserList => Column(
        children: [
          Text(
            "LIVE WITHDRAWAL",
            style: TextStyles.xxxLarge.copyWith(
              color: KAColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 150,
            height: 3,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: KAColors.primaryColor,
            ),
          ),
          spacingVerticalLarge,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: KAColors.primaryColor, width: 4),
                borderRadius: BorderRadius.circular(RadiusConst.largeBox),
                color: KAColors.primaryDarkPurpleColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return (index % 2 == 0)
                              ? getSingleUserList(index)
                              : Container();
                        }),
                  ),
                  spacingHorizontalSmall,
                  Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return (index % 2 == 0)
                              ? getSingleUserList(index)
                              : Container();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget getSingleUserList(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.jumbo25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: KAColors.primaryColor, width: 2),
                  // color: KAColors.primaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.person,
                    color: KAColors.whiteColor,
                  ),
                ),
              ),
              spacingHorizontalSmall,
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "${userList[index]} ₹2250",
                      style: TextStyles.small.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "4 sec ago",
                      style: TextStyles.small.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              spacingHorizontalNormal,
            ],
          ),
        ),
        spacingVerticalSmall,
      ],
    );
  }

  get getVideoLayout => Container(
        height: 200,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
      );

  get getGamesTitle => Column(
        children: [
          Text(
            "GAMES",
            style: TextStyles.xxxLarge.copyWith(
              color: KAColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 150,
            height: 3,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: KAColors.primaryColor,
            ),
          ),
          spacingVerticalLarge,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(RadiusConst.largeBox),
                        color: KAColors.primaryColor,
                      ),
                    ),
                    spacingHorizontalLarge,
                    Text(
                      "Most Popular",
                      style: TextStyles.normal.copyWith(
                          color: KAColors.whiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: KAColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(05),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                  child: Text(
                    showMore ? 'Show Less' : 'Show More',
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget getGridBox() {
    List<String> displayedGames =
        showMore ? listOfGames : listOfGames.sublist(0, 3);
    return SizedBox(
      height: Spacing.jumbo200,
      child: GridView.builder(
        itemCount: displayedGames.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: Spacing.jumbo100,
                width: Spacing.jumbo100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: KAColors.primaryColor),
                  borderRadius: BorderRadius.circular(RadiusConst.largeBox),
                ),
                child: Image(
                  image: AssetImage(listOfGames[index]),
                ),
              ),
              spacingVerticalLarge,
            ],
          );
        },
      ),
    );
  }
}
