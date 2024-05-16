import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Globals {
  static Flavor ctp = catppuccin.mocha;
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
    reloadGlobals();
  }

  static void reloadGlobals() {
    if (prefs.containsKey('theme')) {
      switch (prefs.getString('theme')) {
        case 'Latte':
          ctp = catppuccin.latte;
          break;
        case 'Frappé':
          ctp = catppuccin.frappe;
          break;
        case 'Macchiato':
          ctp = catppuccin.macchiato;
          break;
        case 'Mocha':
          ctp = catppuccin.mocha;
          break;
      }
    }
  }
}
