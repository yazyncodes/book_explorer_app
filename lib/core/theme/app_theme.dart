import 'package:flutter/cupertino.dart';

class AppTheme {
  static final lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemBlue,
    barBackgroundColor: CupertinoColors.systemGrey6,
    scaffoldBackgroundColor: CupertinoColors.white,
  );

  static final darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.activeBlue,
    barBackgroundColor: CupertinoColors.systemGrey,
    scaffoldBackgroundColor: CupertinoColors.black,
  );
}
