import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hofladen/core/models/opening_hours.dart';

@immutable
class OpeningHoursView extends StatelessWidget {
  final List<OpeningHours> openingHours;

  const OpeningHoursView({Key? key, required this.openingHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(AppLocalizations.of(context)!.openingHoursHeader,
          style: TextStyle(fontWeight: FontWeight.bold))
    ];
    children.addAll(openingHours.map((oh) => _DayRow(hours: oh)));
    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

@immutable
class _DayRow extends StatelessWidget {
  final OpeningHours hours;

  const _DayRow({Key? key, required this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              '${_dayFromInt(context, hours.day)}: ${hours.opens.format(context)} - ${hours.closes.format(context)}')
        ]);
  }

  String _dayFromInt(final BuildContext context, final int i) {
    switch (i) {
      case 0:
        return AppLocalizations.of(context)!.mon;
      case 1:
        return AppLocalizations.of(context)!.tue;
      case 2:
        return AppLocalizations.of(context)!.wed;
      case 3:
        return AppLocalizations.of(context)!.thu;
      case 4:
        return AppLocalizations.of(context)!.fri;
      case 5:
        return AppLocalizations.of(context)!.sat;
      case 6:
        return AppLocalizations.of(context)!.sun;
      default:
        return '';
    }
  }
}
