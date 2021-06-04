// import 'dart:async' show Future;
import 'package:zocial_admin/widget/widget.dart' show CityCard;

class CityModel {
  CityModel._privateConstructor();

  static final CityModel instance = CityModel._privateConstructor();
  List<CityCard> _cityCardLists = <CityCard>[];
  List<CityCard> get cityList {
    _cityCardLists = [
      CityCard(
          cityName: "COLOGNE",
          imageUrl: "assets/images/city_manager/city_1.png"),
      CityCard(
          cityName: "MUNICH",
          imageUrl: "assets/images/city_manager/city_2.png"),
      CityCard(
          cityName: "KASSEL",
          imageUrl: "assets/images/city_manager/city_3.png"),
    ];
    return _cityCardLists;
  }

  List<String> _cityNameList = [];

  List<String> get cityNameList {
    _cityNameList = [
      "COLOGNE",
      "MUNICH",
      "KASSEL",
    ];
    return _cityNameList;
  }
  // Future<List<CityCard>> getCityList() async {
  //   _cityCardLists = [
  //     CityCard(
  //         cityName: "COLOGNE",
  //         imageUrl: "assets/images/city_manager/city_1.png"),
  //     CityCard(
  //         cityName: "MUNICH",
  //         imageUrl: "assets/images/city_manager/city_2.png"),
  //     CityCard(
  //         cityName: "KASSEL",
  //         imageUrl: "assets/images/city_manager/city_3.png"),
  //   ];
  //   return _cityCardLists;
  // }
}
