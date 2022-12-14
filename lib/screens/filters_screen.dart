import 'package:flutter/material.dart';
import 'package:order/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';
   final Function saveFilters;
   final Map<String, bool> currentFilter;

   FilterScreen(this.currentFilter,this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;



  @override
  initState(){
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }



  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }
              )
        ],
      ),
      drawer: MainDrawer(),
      body: Column( children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection. ',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only gluten-free meals shown',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      }
                      );
                      },
    ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only lactose-free meals shown',
                  _glutenFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    }
                    );
                  },
                ),

                _buildSwitchListTile(
                  'Vegetarian',
                  'Only vegetarian meals shown',
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    }
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only vegan meals shown',
                    _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    }
                    );
                  },
                )



              ],
    )
    ),
    ],
    )

    );
  }
}
