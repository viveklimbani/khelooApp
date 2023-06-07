// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tution_plus/common/resources/colors.dart';
// import 'package:tution_plus/common/widget/common_widget.dart';
//
// import '../resources/images.dart';
// import '../resources/styles.dart';
//
// class DrawerDashboard extends StatefulWidget {
//   const DrawerDashboard({Key? key}) : super(key: key);
//
//   @override
//   _DrawerDashboardState createState() => _DrawerDashboardState();
// }
//
// class _DrawerDashboardState extends State<DrawerDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//       color: TPColors.primaryColor,
//       width: MediaQuery.of(context).size.width * 0.78,
//       child: Column(
//         children: [
//           spacingVerticalSmall,
//           getUserName,
//           getDivider,
//           spacingVerticalXSmall,
//           getMenuTitle("My Subject", "select your subject", Images.icBatches),
//           getMenuTitle(
//               "My Standards", "select your standards", Images.icMyStandard),
//           getMenuTitle("Change Password", "change your password",
//               Images.icChangePassword),
//           getDivider,
//           getLogoutBtn,
//         ],
//       ),
//     ));
//   }
//
//   get getUserName => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               Images.icPerson,
//             ),
//             spacingHorizontalNormal,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "User Name",
//                   style: TextStyles.large.copyWith(
//                       fontWeight: FontWeight.w600, color: TPColors.whiteColor),
//                 ),
//                 Text("+917778885855",
//                     style: TextStyles.large.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: TPColors.subTitleColor)),
//               ],
//             )
//           ],
//         ),
//       );
//
//   get getDivider => const Divider(
//         color: TPColors.primaryDividerColor,
//         thickness: 1,
//       );
//
//   Widget getMenuTitle(String title, subtitle, iconImage) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             iconImage,
//             color: TPColors.iconColor,
//           ),
//           spacingHorizontalNormal,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyles.regularTextStyle.copyWith(
//                     fontWeight: FontWeight.w500, color: TPColors.whiteColor),
//               ),
//               Text(subtitle,
//                   style: TextStyles.small.copyWith(
//                       fontWeight: FontWeight.w400,
//                       color: TPColors.subTitleColor)),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   get getLogoutBtn => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               Images.icLogout,
//               color: TPColors.iconColor,
//             ),
//             spacingHorizontalXNormal,
//             Text(
//               "Log Out",
//               style: TextStyles.regularTextStyle.copyWith(
//                   fontWeight: FontWeight.w500, color: TPColors.whiteColor),
//             ),
//           ],
//         ),
//       );
// }
