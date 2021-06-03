import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCustomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(barHeight);
  const AppCustomBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.actionIcon,
    this.actionIconTitle,
    this.callback,
    this.titleColor,
    this.pushable,
    this.actionIconData,
    this.actionIconColor,
    this.centerTitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool actionIcon;
  final VoidCallback? callback;
  final Color? titleColor;
  final bool? pushable;
  final IconData? actionIconData;
  final Color? actionIconColor;
  final String? actionIconTitle;
  final String? centerTitle;

  static const double barHeight = 62;

  Widget _titleWidget(BuildContext context) {
    if (subtitle == "" || subtitle.length == 0) {
      if (pushable == true) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: titleColor != null ? titleColor : Color(0xff646876),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: titleColor != null ? titleColor : Color(0xff646876),
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        );
      }
    } else {
      if (pushable == true) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            titleColor != null ? titleColor : Color(0xff646876),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF9C9EA7),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: titleColor != null ? titleColor : Color(0xff646876),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9C9EA7),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget actionIconWidget(String? tempActionIconTitle) {
    if (tempActionIconTitle == "")
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              callback!();
            },
            child: Column(
              children: [
                Icon(
                  this.actionIconData,
                  color: this.actionIconColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      );
    else
      return Column(
        children: [
          Icon(
            this.actionIconData,
            color: this.actionIconColor,
            size: 24,
          ),
          Text(
            actionIconTitle!,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xFF9C9EA7),
                fontWeight: FontWeight.normal),
          )
        ],
      );
  }

  @override
  Widget build(context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    if (actionIcon) {
      return PreferredSize(
        preferredSize: Size.fromHeight(barHeight),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: statusbarHeight),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(context),
                this.centerTitle != ""
                    ? Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.centerTitle!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    : Text(""),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        callback!();
                      },
                      child: actionIconWidget(this.actionIconTitle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return PreferredSize(
        preferredSize: Size.fromHeight(barHeight),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: statusbarHeight),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(context),
                this.centerTitle != ""
                    ? Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.centerTitle!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    : Text(""),
              ],
            ),
          ),
        ),
      );
    }
  }
}
