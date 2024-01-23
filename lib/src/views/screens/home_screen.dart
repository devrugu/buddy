import 'package:flutter/material.dart';
import 'package:buddy/src/views/widgets/custom_button.dart'; // CustomButton widget dosyanızın yolu
import 'package:buddy/src/views/widgets/custom_icons.dart'; // CustomIcons sınıfınızın yolu

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _selectedCountry = 'Select a country';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: [
              ListTile(
                title: const Text('Country Filter'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // Ülke seçimi için bir liste gösterilecek
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select a country'),
                        content: DropdownButton<String>(
                          value: _selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCountry = newValue!;
                              Navigator.pop(context);
                            });
                          },
                          items: <String>['USA', 'Canada', 'Mexico', 'Japan']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const Drawer(
          // Drawer içeriği...
          ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      _openFilterModal();
                    }
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Home Screen Content Here'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.diary),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.places),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
