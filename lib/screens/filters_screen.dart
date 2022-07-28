import 'package:flutter/material.dart';
import 'package:order/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  //const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filter"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filters"),
      ),
    );
  }
}