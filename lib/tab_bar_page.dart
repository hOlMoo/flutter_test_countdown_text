

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_countdown_text/tab_item_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabBarPage> with
    AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('TabBarPage'),
          bottom: TabBar(
              controller:  _tabController,
              tabs: const [
                Tab(text: "1"),
              ]),
        ),
        body: TabBarView(children: const <Widget>[
          TabItemPage(),
        ], controller: _tabController,)
    );
  }
}