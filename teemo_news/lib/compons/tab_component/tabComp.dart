// import 'dart:async';
//
// import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:teemo_news/utils/CommonUtils.dart';
//
// import 'KeepAliveTab.dart';
//
// class TabComp extends StatefulWidget {
//   final List<String> tabs;
//   final void Function(int index, int pageNumber, Function(List<dynamic>))
//       dataHandle;
//   final Widget Function(List<dynamic>) buildResults; // 用于构建结果列表
//
//   TabComp(
//       {super.key,
//       required this.tabs,
//       required this.dataHandle,
//       required this.buildResults});
//
//   @override
//   State<TabComp> createState() => _TabCompState();
// }
//
// class _TabCompState extends State<TabComp>{
//   int tabActiveIndex = 0;
//   int pageNumber = 1;
//
//   Map<int, List<dynamic>> resultsMap = {};
//
//   Map<int, EasyRefreshController> easyRefreshControllerMap = {};
//
//   @override
//   Widget build(BuildContext context) {
//     var tabs = widget.tabs;
//     return Scaffold(
//         body: SafeArea(
//           child: ContainedTabBarView(
//             tabs: [
//               ...List.generate(
//                   tabs.length,
//                   (index) => Tab(
//                         text: "${tabs[index]}",
//                       ))
//             ],
//             views:
//             [
//             ...List.generate(tabs.length, (index)=>new EasyRefreshControllerPage(dataHandle: (String type, dynamic Function(List<dynamic>) ) {  },
//             buildResults: widget.buildResults,
//
//             )),
//             ],
//             initialIndex: tabActiveIndex,
//             onChange: (index) => tabChange(index),
//           ),
//         ));
//   }
//
//   tabChange(int index) {
//     tabActiveIndex = index;
//     var list = getResults();
//     if (list.length == 0) {
//       getEasyRefreshController().callRefresh().then((e) => {print(e)});
//     }
//   }
//
//   getEasyRefreshController() {
//     return easyRefreshControllerMap[tabActiveIndex];
//   }
//
//   getResults() => resultsMap[tabActiveIndex];
//
//   updateResults(vals) => resultsMap[tabActiveIndex] = vals;
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < this.widget.tabs.length; i++) {
//       easyRefreshControllerMap[i] = new EasyRefreshController(
//         controlFinishRefresh: true,
//         controlFinishLoad: true,
//       );
//       resultsMap[i] = [];
//     }
//   }
//
//
//   void _dataHandle(List<dynamic> result) {
//     var results = getResults();
//     results = [...results, ...result];
//     setState(() {
//       updateResults(results);
//     });
//     if (result.length > 0) pageNumber = pageNumber + 1;
//   }
//
//
// }
//
//
//
// class EasyRefreshControllerPage extends StatefulWidget {
//   // const EasyRefreshControllerPage({super.key});
//
//   final void Function(String type,Function(List<dynamic>)) dataHandle;
//   final Widget Function(List<dynamic>) buildResults; // 用于构建结果列表
//
//   EasyRefreshControllerPage(
//       {super.key,
//         required this.dataHandle,
//         required this.buildResults});
//
//   @override
//   State<EasyRefreshControllerPage> createState() => _EasyRefreshControllerPageState();
// }
//
// class _EasyRefreshControllerPageState extends State<EasyRefreshControllerPage> {
//   EasyRefreshController easyRefreshController = new EasyRefreshController(
//     controlFinishRefresh: true,
//     controlFinishLoad: true,
//   );
//
//   int pageNumber = 0;
//
//
//   List<dynamic> resultLists = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return EasyRefresh(
//         controller: easyRefreshController,
//         onRefresh: () => getRefresh(),
//         onLoad: () => getMoreData(),
//         header: CommonUtils.getEasyHeader(),
//         footer: CommonUtils.getEasyFooter(),
//         child: widget.buildResults(resultLists));
//   }
//
//   void _dataHandle(List<dynamic> result) {
//     var results = resultLists;
//     results = [...results, ...result];
//     if (result.length > 0) pageNumber = pageNumber + 1;
//     setState(() {
//       resultLists = results;
//     });
//   }
//
//   Future<void> getMoreData() async {
//     widget.dataHandle("moreData",(res)=>{
//       _dataHandle(res),
//       easyRefreshController.finishLoad(),
//       easyRefreshController.resetHeader()
//     });
//   }
//
//   Future<void> getRefresh() async {
//     widget.dataHandle("refresh",(res)=>{
//       _dataHandle(res),
//       easyRefreshController.finishRefresh(),
//       easyRefreshController.resetFooter(),
//       easyRefreshController.resetHeader()
//     });
//
//
//
//     // widget.dataHandle(
//     //     tabActiveIndex,
//     //     pageNumber,
//     //         (List<dynamic> result) => {
//     //       _dataHandle(result),
//     //       getEasyRefreshController().finishRefresh(),
//     //       getEasyRefreshController().resetFooter(),
//     //       getEasyRefreshController().resetHeader()
//     //     });
//   }
// }
