import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLoading = true;

  void themeChanged(BuildContext context) {
    if (isLoading) {
      isLoading = false;
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
      isLoading = true;
    }
  }
}
