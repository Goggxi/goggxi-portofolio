import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Action {
  final String title;
  final IconData icon;
  final String path;

  Action({
    required this.title,
    required this.icon,
    required this.path,
  });

  static List<Action> get actions => [
        Action(title: 'Youtube', icon: FontAwesomeIcons.youtube, path: ''),
        Action(title: 'Facebook', icon: FontAwesomeIcons.facebook, path: ''),
        Action(title: 'Instagram', icon: FontAwesomeIcons.instagram, path: ''),
        Action(title: 'Linkedin', icon: FontAwesomeIcons.linkedin, path: ''),
        Action(title: 'Twitter', icon: FontAwesomeIcons.twitter, path: ''),
        Action(title: 'Github', icon: FontAwesomeIcons.github, path: ''),
      ];
}
