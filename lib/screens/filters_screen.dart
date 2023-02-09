import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    updateValue,
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
    //timeDilation = 1.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1,
              color: Colors.grey,
            )),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save, size: 27),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          //Container(
          //padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          // child: Positioned(
          Center(
            child: Container(
              width: 420,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
              child: const Text(
                'ADJUST YOUR MEAL SELECTION !',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ),
          // ),
          //  ),
          Expanded(
            child: ListView(
              children: <Widget>[
                //const SizedBox(height: 10),
                Column(
                  children: const [
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
