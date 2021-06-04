import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/screen/city/city_detail.dart';
import 'package:zocial_admin/screen/city/city_list.dart';
import 'package:zocial_admin/widget/widget.dart';
import 'package:zocial_admin/cors/app_state_container.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: "ZOCIAL",
        subtitle: "ZPORTS",
        actionIcon: false,
        // callback: () async => await _androidRefreshKey.currentState!.show(),
        // callback: (){print("object");},
        titleColor: Color(0xff82C034),
        centerTitle: "ADMINISTRATION",
        // actionIconTitle: 'Organizer',
        // actionIconData: Icons.person_add,
        // actionIconColor: Color(0xff82C034),
      ),
      // drawer: widget.androidDrawer,
      body: Container(
        padding: EdgeInsets.only(
          top: 25,
          left: 12,
          right: 12,
        ),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CityList.routeName,
                  );
                },
                leading: Icon(
                  Icons.location_city,
                  color: Color(0xff82C034),
                ),
                title: Text(
                  'City Organizer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CityDetail.routeName,
                  );
                },
                leading: Icon(
                  Icons.person_add,
                  color: Color(0xff82C034),
                ),
                title: Text(
                  'Organizer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  final container = AppStateContainer.of(context);
                  container.onLogout(context);
                },
                leading: Icon(
                  Icons.person_add,
                  color: Color(0xff82C034),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAndroid(context);
  }
}
