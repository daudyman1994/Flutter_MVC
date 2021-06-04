import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zocial_admin/model/model.dart' show SearchOrganizerModel;
import 'package:zocial_admin/widget/widget.dart' show OrganizerItem;

class SearchOrganizer extends StatefulWidget {
  @override
  _SearchOrganizerState createState() => _SearchOrganizerState();
}

class _SearchOrganizerState extends State<SearchOrganizer> {
  List<OrganizerItem> chatUsers = <OrganizerItem>[];
  @override
  void initState() {
    super.initState();
    chatUsers = SearchOrganizerModel.instance.organizerList;
  }

  Widget get _searchWidget {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    // if (index >= chatUsers.length) return Container();
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(chatUsers[index].imageURL),
        maxRadius: 25,
      ),
      title: Text(
        chatUsers[index].name,
        style: TextStyle(fontSize: 16),
      ),
      trailing: chatUsers[index].active == true
          ? CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFFF0000),
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {},
              ),
            )
          : CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff29E145),
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.check, color: Colors.white),
                onPressed: () {},
              ),
            ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            _searchWidget,
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: chatUsers.length,
                  padding: EdgeInsets.only(top: 0),
                  itemBuilder: _listBuilder,
                ),
              ),
            )
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

class FirstDisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
