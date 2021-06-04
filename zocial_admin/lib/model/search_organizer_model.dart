// import 'dart:async' show Future;
import 'package:zocial_admin/widget/widget.dart' show OrganizerItem;

class SearchOrganizerModel {
  SearchOrganizerModel._privateConstructor();

  static final SearchOrganizerModel instance =
      SearchOrganizerModel._privateConstructor();
  List<OrganizerItem> _searchOrganizerList = <OrganizerItem>[];
  List<OrganizerItem> get organizerList {
    _searchOrganizerList = [
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: false,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: false,
      ),
    ];
    return _searchOrganizerList;
  }

  // Future<List<OrganizerItem>> getCityList() async {
  //   _cityCardLists = [
  //     OrganizerItem(
  //         cityName: "COLOGNE",
  //         imageUrl: "assets/images/city_manager/city_1.png"),
  //     OrganizerItem(
  //         cityName: "MUNICH",
  //         imageUrl: "assets/images/city_manager/city_2.png"),
  //     OrganizerItem(
  //         cityName: "KASSEL",
  //         imageUrl: "assets/images/city_manager/city_3.png"),
  //   ];
  //   return _cityCardLists;
  // }
}
