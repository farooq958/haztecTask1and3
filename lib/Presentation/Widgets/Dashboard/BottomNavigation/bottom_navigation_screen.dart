import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskhaztec/Data/DataSource/Resources/assets.dart';
import 'package:taskhaztec/Data/DataSource/Resources/colors_pallete.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/Localisation/localization_screen.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/Page3/dummy_page3.dart';
import 'package:taskhaztec/Presentation/Widgets/Dashboard/ProductHome/product_screen.dart';
import 'package:taskhaztec/Presentation/Widgets/Page4/dummy_page4.dart';

import 'Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';


class BottomNavigationScreen extends StatefulWidget {


  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  PageController pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState


    BottomNotifier.bottomNavigationNotifier.value = 0;
    super.initState();
  }
  //
  // init() {
  //   AppConnectivity.connectionChanged(onDisconnected: () {
  //     Navigate.to(context, const NoInternetConnectionScreen());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // appBar: CustomAppBar(
        //   pageController: pageController,
        //   onSearchTap: () {
        //     Navigate.to(context, SearchScreen(isGuest: widget.isGuest,));
        //   },
        //   onNotificationTap: () {
        //     if (widget.isGuest == true) {
        //       showLoginDialog(context);
        //     } else {
        //       Navigate.to(context, const NotificationScreen());
        //     }
        //   },
        //   onBackTap: () {
        //     scaffoldKey.currentState!.openDrawer();
        //   },),
        // drawer: AppDrawer(isGuest: widget.isGuest!, drawerKey: scaffoldKey),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: PageView(
            controller: pageController,
            physics:
                const BouncingScrollPhysics(),
            onPageChanged: (x) {
              BottomNotifier.bottomNavigationNotifier.value = x;
            },
            children: const [
              ProductScreen(),
              LocalizationScreen(),
              DummyPage3(),
              DummyPage4()




            ],

          ),


        ),
        bottomNavigationBar: ValueListenableBuilder(
          builder: (context, state, child) {
            return Container(
              width: 375.0,
              height: 70.0.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BottomNotifier.bottomNavigationNotifier.value = 0;
                        pageController.jumpToPage(0);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                Assets.homeIcon,
                                color: state == 0
                                    ? AppColors.primaryColor
                                    : const Color(0xffA7A7A7),

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          // Expanded(
                          //   child: Align(
                          //     alignment: Alignment.topCenter,
                          //     child: FittedBox(
                          //       fit: BoxFit.scaleDown,
                          //       child: AppText(
                          //         'Home',
                          //         style: Styles.circularStdRegular(
                          //           context,
                          //           fontSize: 13.0.sp,
                          //           color: state == 0
                          //               ? AppColors.primaryColor
                          //               : const Color(0xffA7A7A7),
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //         textAlign: TextAlign.center,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),

                  ///1
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BottomNotifier.bottomNavigationNotifier.value = 1;
                        pageController.jumpToPage(1);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                Assets.cartIcon,
                                color: state == 1
                                    ? AppColors.primaryColor
                                    : const Color(0xffA7A7A7),

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),

                        ],
                      ),
                    ),
                  ),

                  ///2
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BottomNotifier.bottomNavigationNotifier.value = 2;
                        pageController.jumpToPage(2);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                Assets.likeIcon,
                                color: state == 2
                                    ? AppColors.primaryColor
                                    : null,

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),

                        ],
                      ),
                    ),
                  ),

                  ///3
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {
                  //
                  //       {
                  //         BottomNotifier.bottomNavigationNotifier.value = 3;
                  //         pageController.jumpToPage(3);
                  //       }
                  //     },
                  //     child: Column(
                  //       children: [
                  //         Expanded(
                  //           child: Align(
                  //             alignment: Alignment.bottomCenter,
                  //
                  //               child: SvgPicture.asset(
                  //                 Assets.cartIcon,
                  //                 color: state == 3
                  //                     ? AppColors.primaryColor
                  //                     : const Color(0xffA7A7A7),
                  //
                  //               ),
                  //
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 5.sp,
                  //         ),
                  //
                  //       ],
                  //     )
                  //   ),
                  // ),

                  ///3
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BottomNotifier.bottomNavigationNotifier.value = 3;
                        pageController.jumpToPage(3);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                Assets.profileIcon,
                                color: state == 3
                                    ? AppColors.primaryColor
                                    : const Color(0xffA7A7A7),

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }, valueListenable: BottomNotifier.bottomNavigationNotifier,
        )


    );
  }
}
