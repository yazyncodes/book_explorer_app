import 'package:flutter/cupertino.dart';

class AppHeader extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget? trailing;

  const AppHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
      trailing: trailing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
