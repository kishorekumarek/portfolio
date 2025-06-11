import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  AppThemeType _currentThemeType = AppThemeType.defaultTheme;
  AppTheme _currentTheme = AppTheme.defaultTheme;

  AppThemeType get currentThemeType => _currentThemeType;
  AppTheme get currentTheme => _currentTheme;

  void setTheme(AppThemeType themeType) {
    _currentThemeType = themeType;
    _currentTheme = AppTheme.getTheme(themeType);
    notifyListeners();
  }

  void toggleTheme() {
    switch (_currentThemeType) {
      case AppThemeType.defaultTheme:
        setTheme(AppThemeType.pastel);
        break;
      case AppThemeType.pastel:
        setTheme(AppThemeType.light);
        break;
      case AppThemeType.light:
        setTheme(AppThemeType.dark);
        break;
      case AppThemeType.dark:
        setTheme(AppThemeType.defaultTheme);
        break;
    }
  }

  String get themeName => _currentTheme.name;
  
  List<AppThemeType> get availableThemes => AppThemeType.values;
} 