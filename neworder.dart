import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Order',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: NewOrderScreen(),
    );
  }
}

class NewOrderScreen extends StatefulWidget {
  @override
  _NewOrderScreenState createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  int _teaQuantity = 1;
  int _bournvitaQuantity = 1;
  int _coffeeQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 220, 220),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('New Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Tea Seller',
              ),
              items: ['Ram bhai', "Mahesh bhai", "Yogesh bhai"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Menu', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            buildMenuItem('Tea', _teaQuantity, 15),
            SizedBox(height: 8.0),
            buildMenuItem('Bournvita', _bournvitaQuantity, 25),
            SizedBox(height: 16.0),
            buildMenuItem('Coffee', _coffeeQuantity, 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Total: ₹${_calculateTotal()}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle place order button press
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String item, int quantity, int price) {
    return Row(
      children: [
        Expanded(
          child: Text(item),
        ),
        SizedBox(width: 8.0),
        IconButton(
          onPressed: () {
            setState(() {
              if (item == 'Tea') {
                _teaQuantity = _teaQuantity > 1 ? _teaQuantity - 1 : 1;
              }
              if (item == 'Bournvita') {
                _bournvitaQuantity =
                    _bournvitaQuantity > 1 ? _bournvitaQuantity - 1 : 1;
              } else if (item == 'Coffee') {
                _coffeeQuantity = _coffeeQuantity > 1 ? _coffeeQuantity - 1 : 1;
              }
            });
          },
          icon: Icon(Icons.remove),
        ),
        Text('$quantity'),
        SizedBox(width: 8.0),
        IconButton(
          onPressed: () {
            setState(() {
              if (item == 'Tea') {
                _teaQuantity++;
              }
              if (item == 'Bournvita') {
                _bournvitaQuantity++;
              } else if (item == 'Coffee') {
                _coffeeQuantity++;
              }
            });
          },
          icon: Icon(Icons.add),
        ),
        SizedBox(width: 8.0),
        Text('x $price ='),
        Text('${quantity * price}'),
      ],
    );
  }

  int _calculateTotal() {
    return _teaQuantity * 15 + _bournvitaQuantity * 25 + _coffeeQuantity * 20;
  }
}
