import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/screen/organizer/search_organizer.dart';
import 'package:zocial_admin/widget/widget.dart';
// import 'package:zocial_admin/model/model.dart';
import 'package:zocial_admin/screen/organizer/active_organizer.dart';

class OrganizerHome extends StatefulWidget {
  OrganizerHome({Key? key}) : super(key: key);
  final String title = "Create Organizer";
  static String routeName = "/organizer";
  @override
  _OrganizerHomeState createState() => _OrganizerHomeState();
}

class _OrganizerHomeState extends State<OrganizerHome>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;

        // print("currnet index is here $_currentIndex");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget get _organizerTab {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: _currentIndex,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(70),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75),
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0.0,
                        backgroundColor:
                            const Color(0xFFFFFFFF).withOpacity(0.0),
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Color(0xff82C034),
                              indicatorWeight: 5,
                              // isScrollable: true,
                              controller: _tabController,
                              tabs: [
                                Text(
                                  "Active",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff646876),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "User Search",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff646876),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      ActiveOrganizer(searchBox: true),
                      SearchOrganizer(),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: widget.title,
        subtitle: "",
        actionIcon: false,
        pushable: true,
      ),
      // drawer: widget.androidDrawer,
      body: Container(
        child: Column(
          children: <Widget>[
            _organizerTab,
          ],
        ),
      ),
    );
  }
}
