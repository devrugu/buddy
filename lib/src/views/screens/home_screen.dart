import 'package:flutter/material.dart';
import 'package:buddy/src/views/widgets/custom_button.dart';
import 'package:buddy/src/views/widgets/custom_icons.dart';
import 'package:buddy/src/views/widgets/guide_card.dart';

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

  final List<Map<String, dynamic>> guides = [
    {
      'name': 'Can',
      'location': 'Istanbul',
      'bio': 'Born and raised in Istanbul',
      'reviews': 9,
      'rating': 5.0,
      'hourlyRate': 'FREE',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Berk',
      'location': 'Çanakkale',
      'bio': 'History lover and foodie',
      'reviews': 12,
      'rating': 4.5,
      'hourlyRate': '50₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Elif',
      'location': 'Izmir',
      'bio': 'Exploring hidden gems of my city',
      'reviews': 8,
      'rating': 4.8,
      'hourlyRate': '30₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Ahmet',
      'location': 'Ankara',
      'bio': 'Ankara\'s history and culture enthusiast',
      'reviews': 14,
      'rating': 4.2,
      'hourlyRate': '45₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Leyla',
      'location': 'Antalya',
      'bio': 'Beach life and historical tours',
      'reviews': 20,
      'rating': 4.9,
      'hourlyRate': '60₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Mehmet',
      'location': 'Bursa',
      'bio': 'Mountains and myths of Bursa',
      'reviews': 5,
      'rating': 4.4,
      'hourlyRate': '35₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Selin',
      'location': 'Edirne',
      'bio': 'A guide to Edirne\'s architectural wonders',
      'reviews': 11,
      'rating': 4.7,
      'hourlyRate': '40₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Ozan',
      'location': 'Sivas',
      'bio': 'Sivas through the ages',
      'reviews': 9,
      'rating': 4.3,
      'hourlyRate': '55₺',
      'image': 'assets/images/profile.jpg'
    },
    {
      'name': 'Samet',
      'location': 'Ordu',
      'bio': 'The rivers and valleys of Ordu',
      'reviews': 14,
      'rating': 5.0,
      'hourlyRate': '50₺',
      'image': 'assets/images/profile.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 100,
                    ),
                    Text(
                      'Uğurcan Yılmaz',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return GuideCard(
                  name: guide['name'],
                  location: guide['location'],
                  bio: guide['bio'],
                  reviews: guide['reviews'],
                  rating: guide['rating'],
                  hourlyRate: guide['hourlyRate'],
                  image: guide['image'],
                );
              },
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
