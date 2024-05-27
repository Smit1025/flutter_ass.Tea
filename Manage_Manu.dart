import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageMenuItemScreen(),
    );
  }
}

class ManageMenuItemScreen extends StatefulWidget {
  @override
  _ManageMenuItemScreenState createState() => _ManageMenuItemScreenState();
}

class _ManageMenuItemScreenState extends State<ManageMenuItemScreen> {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Tea', price: 10, isSelected: true),
    MenuItem(name: 'Coffee', price: 20, isSelected: false),
    MenuItem(name: 'Bournvita', price: 25, isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Menu Item'),
        backgroundColor: Colors.brown[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: 'Rambhai',
              decoration: InputDecoration(
                labelText: 'Tea Seller',
              ),
              items: ['Rambhai', 'XYZ', 'ABC'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(menuItems[index].name),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${menuItems[index].price}'),
                        Checkbox(
                          value: menuItems[index].isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              menuItems[index].isSelected = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[300],
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[300],
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text('Add New Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final int price;
  bool isSelected;

  MenuItem({required this.name, required this.price, this.isSelected = false});
}
