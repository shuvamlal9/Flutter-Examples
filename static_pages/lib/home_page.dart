import 'package:flutter/material.dart';
import 'package:static_pages/button_section.dart';
import 'package:static_pages/image_section.dart';
import 'package:static_pages/text_section.dart';
import 'package:static_pages/title_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageSection(),
        TitleSection(),
        ButtonSection(),
        TextSection()
      ],
    );
  }
}