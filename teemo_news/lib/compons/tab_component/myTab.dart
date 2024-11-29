import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';

import '../../utils/CommonUtils.dart';

class RefreshableListView extends StatefulWidget {

  final void Function(String type,int pageNumber, Function(List<dynamic>))
  dataHandle;
  final Widget Function(List<dynamic>) buildResults; // 用于构建结果列表

  RefreshableListView(
      {super.key,
        required this.dataHandle,
        required this.buildResults});

  @override
  State<RefreshableListView> createState() => _RefreshableListViewState();
}

class _RefreshableListViewState extends State<RefreshableListView> {

  int pageNumber = 1;
  List<dynamic> relustList =[];
  EasyRefreshController easyRefreshController = new EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );


  void _dataHandle(List<dynamic> result) {
    var results = relustList;
    results = [...results, ...result];
    if (result.length > 0) pageNumber = pageNumber + 1;
    setState(() {
      relustList = results;
    });

  }


  Future<void> getMoreData() async {
    widget.dataHandle("moreData",pageNumber,(res)=>{
      _dataHandle(res),
      easyRefreshController.finishLoad(),
      easyRefreshController.resetHeader()
    });
  }

  Future<void> getRefresh() async {
    widget.dataHandle("refresh",pageNumber,(res)=>{
      _dataHandle(res),
      easyRefreshController.finishRefresh(),
      easyRefreshController.resetFooter(),
      easyRefreshController.resetHeader()
    });
}

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: easyRefreshController,
        onRefresh: () => getRefresh(),
        onLoad: () => getMoreData(),
        header: CommonUtils.getEasyHeader(),
        footer: CommonUtils.getEasyFooter(),
        child: widget.buildResults(relustList));
  }
}
