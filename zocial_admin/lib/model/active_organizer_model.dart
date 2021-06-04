// import 'dart:async' show Future;
import 'package:zocial_admin/widget/widget.dart' show OrganizerItem;

class ActiveOrganizerModel {
  ActiveOrganizerModel._privateConstructor();

  static final ActiveOrganizerModel instance =
      ActiveOrganizerModel._privateConstructor();
  List<OrganizerItem> _activeOrganizerLists = <OrganizerItem>[];
  List<OrganizerItem> get organizerList {
    _activeOrganizerLists = [
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_1.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_2.png",
        active: true,
      ),
      OrganizerItem(
        name: "Jane Russel",
        imageURL: "assets/images/avatar_3.png",
        active: true,
      ),
    ];
    return _activeOrganizerLists;
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
