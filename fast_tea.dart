import 'package:flutter/material.dart';

class TeaDiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea Diary',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: TeaDiaryHomePage(),
    );
  }
}

class TeaDiaryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.brown,
                    child: ListTile(
                      title: Center(child: Text('0')),
                      subtitle: Center(child: Text('Tea/Coffee in August')),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Card(
                    color: Colors.brown,
                    child: ListTile(
                      title: Center(child: Text('₹ 0')),
                      subtitle: Center(child: Text('Amount of August')),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _buildGridTile(
                    context,
                    Icons.store,
                    'Seller',
                  ),
                  _buildGridTile(context, Icons.book, 'Item'),
                  _buildGridTile(context, Icons.person, 'Sellerwise Item'),
                  _buildGridTile(context, Icons.edit, 'New Order'),
                  _buildGridTile(context, Icons.receipt, 'Generate Bill'),
                  _buildGridTile(context, Icons.history, 'Bill History'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.share),
        backgroundColor: Colors.brown,
      ),
    );
  }

  Widget _buildGridTile(BuildContext context, IconData icon, String title) {
    return Card(
      child: InkWell(
        onTap: () {
          // Add navigation or action
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
