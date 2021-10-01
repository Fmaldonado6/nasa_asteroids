import 'package:flutter/material.dart';

class AsteroidInfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const AsteroidInfoTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [Text(title), Text(subtitle)],
      ),
    );
  }
}
