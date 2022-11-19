import 'package:flutter_svg/svg.dart';

class SettingsMenuItem {
  final String title;
  final SvgPicture svg;
  final SvgPicture? trailingSvg;
  bool? hasTrailingSvg = true;

  SettingsMenuItem({
    required this.title,
    required this.svg,
    this.trailingSvg,
    this.hasTrailingSvg,
  });
}
