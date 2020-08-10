import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  static IconData plans = _getIconData(0xe917);
  static IconData workouts = _getIconData(0xe915);
  static IconData exercises = _getIconData(0xe916);
  static IconData close = Icons.cancel;
  static IconData filters = Icons.filter_list;
  static IconData fullScreen = Icons.fullscreen;
  static IconData chevronRight = _getIconData(0xe900);
  static IconData home = FontAwesomeIcons.home;
  static IconData search = Icons.search;
  static IconData minus_circle = FontAwesomeIcons.minusCircle;
  static IconData email = Icons.mail;
  static IconData phoneNumber = Icons.phone;
  static IconData address = Icons.map;
  static IconData share = Icons.share;
  static IconData user = Icons.account_circle;
  static IconData password = _getIconData(0xe90a);
  static IconData facebook = _getIconData(0xe900);
  static IconData google = _getIconData(0xe909);
  static IconData twitter = FontAwesomeIcons.twitter;
  static IconData instagram = FontAwesomeIcons.instagram;
  static IconData youtube = FontAwesomeIcons.youtube;
  static IconData sign_out = _getIconData(0xe90e);
  static IconData theme = _getIconData(0xe913);
  static IconData dark_theme = _getIconData(0xe90d);
  static IconData light_theme = _getIconData(0xe912);
  static IconData system_theme = _getIconData(0xe911);
  static IconData languages = _getIconData(0xe90f);
  static IconData settings = Icons.settings;
  static IconData filter_list = Icons.filter_list;
  static IconData message = _getIconData(0xe903);
  static IconData clients = Icons.account_circle;
  static IconData groups = Icons.supervised_user_circle;
  static IconData add = Icons.add;
  static IconData edit = Icons.edit;
  static IconData money = Icons.attach_money;
  static IconData arrow_up = Icons.arrow_upward;
  static IconData arrow_down = Icons.arrow_downward;

  static IconData _getIconData(int codePoint) => IconData(codePoint, fontFamily: 'AppIcons');
}
