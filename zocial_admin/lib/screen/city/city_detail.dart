import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/screen/organizer/search_organizer.dart';
import 'package:zocial_admin/widget/widget.dart';
// import 'package:zocial_admin/model/model.dart';
import 'package:zocial_admin/screen/organizer/active_organizer.dart';

class CityDetail extends StatefulWidget {
  CityDetail({Key? key}) : super(key: key);

  static String routeName = "/city/city_detail";
  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> with TickerProviderStateMixin {
  late CityDetailScreenArguments arguments;
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
    arguments =
        ModalRoute.of(context)!.settings.arguments as CityDetailScreenArguments;
    return _build(context);
  }

  Widget get _cityDetailThumbnail {
    return Container(
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.zero,
        image: DecorationImage(
          image: AssetImage(arguments.reportImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 200,
        color: Colors.black38.withOpacity(0.0),
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        child: Text(
          arguments.reportTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget get _cityDetailOrganizerTab {
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
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75),
                        )
                      ]),
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
                      ActiveOrganizer(),
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
        title: arguments.reportTitle.toUpperCase(),
        subtitle: "",
        actionIcon: false,
        pushable: true,
      ),
      // drawer: widget.androidDrawer,
      body: Container(
        child: Column(
          children: <Widget>[
            _cityDetailThumbnail,
            _cityDetailOrganizerTab,
          ],
        ),
      ),
    );
  }
}
