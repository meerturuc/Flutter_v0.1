import 'package:flutter/material.dart';
import 'package:flutter_application_1/compenets/card/categories_card.dart';
import 'package:flutter_application_1/core/base/base_state.dart';
import 'package:flutter_application_1/core/extension/context_extension.dart';
import 'package:flutter_application_1/view/home/home_view_model.dart';

import 'home_mode.dart';

part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  HomeModel model;
  HomeViewModel viewModel = HomeViewModel();
  final _HomeStringValues values = _HomeStringValues();
  int value = 0;
  @override
  void initState() {
    super.initState();
    model = HomeModel('Selam', 'Örnek1');
    getSharedValues();
  }

  Future<void> getSharedValues() async {
    value = await viewModel.getValueOnPrefences();
    setState(() {});
  }

  void _changeValue() {
    value = viewModel.randomValue();
    viewModel.setValueOnPrefences(value);
    setState(() {});
  }

  Color get _primary => value % 2 == 0 ? Colors.red : Colors.blue;
  Color get _secondary => value % 2 == 0 ? Colors.green : Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(),
      body: Column(
        children: [
          buildText(context),
          Expanded(child: buildCategoriesCard()),
          Expanded(flex: 2, child: buildListView(context))
        ],
      ),
    );
  }

// Deneme yazısı
  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _changeValue,
      child: Text('$value'),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      values.title,
      style: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(color: colorConstants.appleBlossom),
    );
  }

  CategoriesCard buildCategoriesCard() {
    return CategoriesCard(
      body: model.title,
      name: model.description,
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.1),
          color: _secondary,
        ),
        AnimatedContainer(
            duration: durationConstants.durationLow,
            height: context.dynamicHeight(0.01),
            color: _primary),
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.11),
          color: _secondary,
        ),
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.21),
          color: _primary,
        ),
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.31),
          color: _secondary,
        ),
        AnimatedContainer(
            duration: durationConstants.durationLow,
            height: context.dynamicHeight(0.01),
            color: _primary),
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.21),
          color: _secondary,
        ),
        AnimatedContainer(
          duration: durationConstants.durationLow,
          height: context.dynamicHeight(0.11),
          color: _primary,
        ),
      ],
    );
  }
}
