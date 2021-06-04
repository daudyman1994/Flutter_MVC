import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/widget/widget.dart';
import 'package:zocial_admin/model/model.dart' show CityModel;

import 'city_detail.dart';

class CityList extends StatefulWidget {
  CityList({Key? key}) : super(key: key);
  static String appbarTitle = "city organizer";
  static String routeName = "/city/city_list";
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  int _itemsLength = 0;
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  List<CityCard> cityCardLists = [];
  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    cityCardLists = CityModel.instance.cityList;
    _itemsLength = cityCardLists.length;
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
      () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return Container();
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: index,
        child: CityEventCard(
          title: cityCardLists[index].cityName,
          backgroundImage: cityCardLists[index].imageUrl,
          heroAnimation: AlwaysStoppedAnimation(0),
          onPressed: () {
            Navigator.pushNamed(context, CityDetail.routeName,
                arguments: CityDetailScreenArguments(
                  cityCardLists[index].cityName,
                  cityCardLists[index].imageUrl,
                )
                // arguments: cityCardLists[index].cityName,
                );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: CityList.appbarTitle.toUpperCase(),
        subtitle: "",
        pushable: true,
        actionIcon: false,
      ),
      // drawer: widget.androidDrawer,
      body: RefreshIndicator(
        key: _androidRefreshKey,
        onRefresh: _refreshData,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 12),
          itemCount: _itemsLength,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }
}
