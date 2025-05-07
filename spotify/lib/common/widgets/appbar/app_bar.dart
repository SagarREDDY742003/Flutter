import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  const BasicAppBar({this.title, this.hideBack = false,this.action, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(''),
      actions: [
        action ?? Container()
      ],
      centerTitle: true,
      leading:
          hideBack
              ? null
              : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color:
                        context.isDarkMode
                            ? const Color.fromARGB(52, 255, 255, 255)
                            : const Color.fromARGB(29, 0, 0, 0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
