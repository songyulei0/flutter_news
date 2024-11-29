import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:teemo_news/utils/ColorsUtils.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeLogic>();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Obx(() {
        return Scaffold(
            body: IndexedStack(
              index: ctrl.currentIndex.value,
              children: ctrl.pages,
            ),
            extendBody: true, //<------like this
            bottomNavigationBar: SizedBox(
              height: 40.h,
              child: CustomNavigationBar(
                selectedColor: ColorsUtils.primary,
                backgroundColor: Colors.grey.shade200,
                strokeColor: ColorsUtils.primary,
                iconSize: 20,
                  currentIndex: ctrl.currentIndex.value,
                  onTap: (index) => ctrl.updateIndex(index),
                  items: [
                    CustomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      selectedTitle:  Text('首页',style: TextStyle(fontSize: 12.sp,color: ColorsUtils.primary),),
                      title: Text('首页',style: TextStyle(fontSize: 10.sp,color: Colors.grey.shade700),),
                    ),
                    CustomNavigationBarItem(
                      icon: Icon(Bootstrap.x_diamond),
                      selectedTitle:Text('二手',style: TextStyle(fontSize: 12.sp,color: ColorsUtils.primary),),
                      title: Text('二手',style: TextStyle(fontSize: 10.sp,color: Colors.grey.shade700)),
                    ),
                    CustomNavigationBarItem(
                      icon: Icon(Icons.chat_outlined),
                      selectedTitle:  Text('论坛',style: TextStyle(fontSize: 12.sp,color: ColorsUtils.primary),),
                      title: Text('论坛',style: TextStyle(fontSize: 10.sp,color: Colors.grey.shade700)),
                    ),
                    CustomNavigationBarItem(
                      icon: Icon(Bootstrap.briefcase),
                      selectedTitle:  Text('工作',style: TextStyle(fontSize: 12.sp,color: ColorsUtils.primary),),
                      title: Text('工作',style: TextStyle(fontSize: 10.sp,color: Colors.grey.shade700)),
                    ),
                    CustomNavigationBarItem(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedTitle:  Text('我的',style: TextStyle(fontSize: 12.sp,color: ColorsUtils.primary),),
                      title: Text('我的',style: TextStyle(fontSize: 10.sp,color: Colors.grey.shade700)),
                    )
                  ]),
            )

            // CrystalNavigationBar(
            //   currentIndex: ctrl.currentIndex.value,
            //   onTap: (index)=> ctrl.updateIndex(index),
            //   indicatorColor: Colors.purple,
            //   // backgroundColor: Colors.transparent,
            //   backgroundColor: Colors.black.withOpacity(0.1),
            //   outlineBorderColor:Colors.transparent,
            //   enableFloatingNavBar: true,
            //   items: [
            //     CrystalNavigationBarItem(
            //       icon: Icons.home,
            //       unselectedIcon: Icons.home_outlined,
            //       selectedColor: Colors.purple,
            //     ),
            //     CrystalNavigationBarItem(
            //       icon: Icons.add,
            //       unselectedIcon: Icons.chat_outlined,
            //       selectedColor: Colors.purple,
            //     ),
            //     // person_rounded
            //     CrystalNavigationBarItem(
            //       icon:  Icons.person_outline_rounded,
            //       unselectedIcon: Icons.person_rounded,
            //       selectedColor: Colors.pink,
            //     ),
            //   ],
            // ),
            // bottomNavigationBar: Padding(
            //   padding: EdgeInsets.only(bottom: 0.h),
            //   child: CustomNavigationBar(
            //     // isFloating: true,
            //     borderRadius: Radius.circular(10),
            //     currentIndex: ctrl.currentIndex.value,
            //     onTap: (e) => ctrl.updateIndex(e),
            //     items: [
            //       CustomNavigationBarItem(icon: Icon(Icons.home)),
            //       CustomNavigationBarItem(
            //         icon: Icon(Icons.shopping_cart),
            //       ),
            //       CustomNavigationBarItem(
            //         icon: Icon(Icons.lightbulb_outline),
            //       ),
            //       CustomNavigationBarItem(
            //         icon: Icon(Icons.search),
            //       ),
            //       CustomNavigationBarItem(
            //         icon: Icon(Icons.account_circle),
            //       ),
            //     ],
            //   ),
            // ),
            );
      }),
    );
  }
}
