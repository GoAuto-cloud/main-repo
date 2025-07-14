import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigationBarExample());
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0, // Align logo to the very left
        title: Row(
          children: [
            // 🔹 Logo on the left
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/logo.png', // <-- your logo file
                height: 70,
              ),
            ),
            // 🔹 App name or title
            const Text(''),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:
      ListsWithCards(),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ListsWithCards extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // Sample data for three lists
    // List<List<String>> listsData = [
    //   ['Create job card', 'Invoice', 'Download bill']
    // ];

    final List<Map<String, String>> listsData = [
      {'title': 'Create job card', 'image': 'assets/ic_add.svg'},
      {'title': 'Invoice', 'image': 'assets/ic_invoice.svg'},
      {'title': 'Download bill', 'image': 'assets/ic_download.svg'},
    ];


    return ListView.builder(
      itemCount: listsData.length,
      itemBuilder: (context, index) {
        return CardList(listData: listsData[index]);
      },
    );
  }

}

class CardList extends StatelessWidget {
  final Map<String, String> listData;

  const CardList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // 🔹 Click event
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked: ${listData['title']}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // 🔹 Image on the left
              SvgPicture.asset(
                listData['image']!,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              // 🔹 Text on the right
              Text(
                listData['title']!,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

}