import 'package:flutter/material.dart';

import '../../cosnstant/border_constant.dart';
import '../../cosnstant/color_constant.dart';
import '../../cosnstant/padding.constant.dart';

class CategoriesCard extends StatelessWidget {
  final String name;
  final String body;

  const CategoriesCard({Key key, @required this.name, @required this.body})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      margin: PaddingConstants.instance.paddingAllNormal,
      shape: BorderConstants.instance.border1,
      child: buildAlignPaddingText(context),
    );
  }

  Align buildAlignPaddingText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: PaddingConstants.instance.paddingAllNormal,
        child: buildColumnText(context),
      ),
    );
  }

  Column buildColumnText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextName(context),
        buildTextBody(context),
      ],
    );
  }

  Text buildTextName(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline3.copyWith(
          color: ColorConstants.instance.darkApple,
          fontWeight: FontWeight.bold),
    );
  }

  Text buildTextBody(BuildContext context) {
    return Text(
      body,
      style: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: ColorConstants.instance.blueDark),
    );
  }
}
