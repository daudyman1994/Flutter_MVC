import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard {
  String cityName;
  String imageUrl;
  CityCard({
    required this.cityName,
    required this.imageUrl,
  });
}

class CityEventCard extends StatelessWidget {
  CityEventCard({
    required this.title,
    required this.heroAnimation,
    required this.backgroundImage,
    this.onPressed,
  });

  final String title;
  final Animation<double> heroAnimation;
  final String backgroundImage;
  final VoidCallback? onPressed;

  // double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(context) {
    // This is an inefficient usage of AnimatedBuilder since it's rebuilding
    // the entire subtree instead of passing in a non-changing child and
    // building a transition widget in between.
    //
    // Left simple in this demo because this card doesn't have any real inner
    // content so this just rebuilds everything while animating.
    // print(backgroundImage);
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return PressableCard(
          onPressed: heroAnimation.value == 0 ? onPressed : null,
          color: Colors.white.withOpacity(0.0),
          flattenAnimation: heroAnimation,
          child: SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 200,
                      color: Colors.black38,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PressableCard extends StatefulWidget {
  const PressableCard({
    this.onPressed,
    required this.color,
    required this.flattenAnimation,
    this.child,
  });

  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> flattenAnimation;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard>
    with SingleTickerProviderStateMixin {
  bool pressed = false;
  late final AnimationController controller;
  late final Animation<double> elevationAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );
    elevationAnimation =
        controller.drive(CurveTween(curve: Curves.easeInOutCubic));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double get flatten => 1 - widget.flattenAnimation.value;

  @override
  Widget build(context) {
    return Listener(
      onPointerDown: (details) {
        if (widget.onPressed != null) {
          controller.forward();
        }
      },
      onPointerUp: (details) {
        controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onPressed?.call();
        },
        // This widget both internally drives an animation when pressed and
        // responds to an external animation to flatten the card when in a
        // hero animation. You likely want to modularize them more in your own
        // app.
        child: AnimatedBuilder(
          animation:
              Listenable.merge([elevationAnimation, widget.flattenAnimation]),
          child: widget.child,
          builder: (context, child) {
            return Transform.scale(
              // This is just a sample. You likely want to keep the math cleaner
              // in your own app.
              scale: 1 - elevationAnimation.value * 0.03,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16) *
                    flatten,
                child: PhysicalModel(
                  elevation:
                      ((1 - elevationAnimation.value) * 10 + 10) * flatten,
                  borderRadius: BorderRadius.circular(26 * flatten),
                  clipBehavior: Clip.antiAlias,
                  color: widget.color,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
    this.actionIconBackgroundColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool actionIcon;
  final VoidCallback? callback;
  final Color? titleColor;
  final bool? pushable;
  final IconData? actionIconData;
  final Color? actionIconColor;
  final Color? actionIconBackgroundColor;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        this.actionIconBackgroundColor == null
            ? GestureDetector(
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
              )
            : Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(this.actionIconData),
                  color: this.actionIconColor,
                  onPressed: () {
                    callback!();
                  },
                ),
                decoration: BoxDecoration(
                    color: this.actionIconBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
        tempActionIconTitle != ""
            ? Text(
                actionIconTitle!,
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9C9EA7),
                    fontWeight: FontWeight.normal),
              )
            : SizedBox(
                height: 0,
              ),
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
                if (this.centerTitle != "" && this.centerTitle != null)
                  Expanded(
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
                else
                  SizedBox(
                    width: 0,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    actionIconWidget(this.actionIconTitle),
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
                if (this.centerTitle != "" && this.centerTitle != null)
                  Expanded(
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
                else
                  Text(""),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class CityDetailScreenArguments {
  final String reportTitle;
  final String reportImageUrl;

  CityDetailScreenArguments(this.reportTitle, this.reportImageUrl);
}

class OrganizerItem {
  String name;
  String imageURL;
  bool active;
  OrganizerItem({
    required this.name,
    required this.imageURL,
    required this.active,
  });
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.icon,
    required this.hint,
    this.obsecure = false,
    this.validator,
    this.minlines,
    this.maxlines,
    this.label,
    required this.onSaved,
  });
  final FormFieldSetter<String> onSaved;
  final IconData? icon;
  final String hint;
  final bool obsecure;
  final int? minlines;
  final int? maxlines;
  final String? label;
  final FormFieldValidator<String?>? validator;
  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              child: Text(
                label!,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            TextFormField(
              onSaved: onSaved,
              validator: validator,
              autofocus: true,
              minLines: minlines,
              maxLines: maxlines,
              obscureText: obsecure,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 16),
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xff707070),
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xff707070),
                    width: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Text(label!),
            TextFormField(
              onSaved: onSaved,
              validator: validator,
              autofocus: true,
              minLines: minlines,
              maxLines: maxlines,
              obscureText: obsecure,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20),
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xff707070),
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xff707070),
                    width: 3,
                  ),
                ),
                prefixIcon: Padding(
                    child: IconTheme(
                      data: IconThemeData(
                        color: Color(0xff707070),
                      ),
                      child: Icon(icon),
                    ),
                    padding: EdgeInsets.only(left: 30, right: 10)),
              ),
            ),
          ],
        ),
      );
    }
  }
}
