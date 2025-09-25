import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRC Portal',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> imgList = [
    {
      'url':
      'https://tse4.mm.bing.net/th/id/OIP.-YRSLMznMNoB2G2LGt0B9wHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
      'description':
      'MISSION : GRC is creating a culture for successful, socially responsible, morally upright skilled workers, and highly competent professionals through values based quality education.',
    },
    {
      'url':
      'https://thvnext.bing.com/th/id/OIP.jtphV0yUkY6-LOwrPcmosAHaFj?w=229&h=180&c=7&r=0&o=7&cb=ucfimg2&dpr=1.3&pid=1.7&rm=3&ucfimg=1',
      'description':
      'VISION: A global community of excellent individuals with values',
    },
    {
      'url':
      'https://grc.edu.ph/wp-content/uploads/2022/11/20220526_141937-min-1024x576.jpg',
      'description': 'College of Computer Studies',
    },
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Actual Home Content Would Go Here (e.g., the Carousel)',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    ),
    Text(
      'Events Content',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    Text(
      'Academics Content',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Center(
              child: Text(
                'GLOBAL RECIPROCAL COLLEGES',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 300.0, autoPlay: true, enlargeCenterPage: true),
              items: imgList.map((item) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          item['url']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image,
                                  size: 100, color: Colors.grey),
                        ),
                      ),
                      Container(
                        color: Color(0xFF800000).withOpacity(0.9),
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item['description']!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Touching Hearts, Renewing Minds, Transforming Lives',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Image.network(
                'https://grc.edu.ph/wp-content/uploads/elementor/thumbs/it-outu8f4vazq9hp49ntbuxv3pe85vgr5rndrar3lmiw.jpg',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> pageContents = <Widget>[
      _buildHomeContent(),
      Center(child: _widgetOptions.elementAt(1)),
      Center(child: _widgetOptions.elementAt(2)),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF800000),
      appBar: AppBar(
        title: Text(
          'GRC Portal',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF800000),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF800000),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Image.network(
                  'https://grc.edu.ph/wp-content/uploads/2020/08/LOGO_ORIGINAL-removebg-preview.png',
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('HOME', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.event, color: Colors.white),
                  title: Text('EVENTS', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.school, color: Colors.white),
                  title:
                  Text('ACADEMICS', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  }),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('SETTINGS', style: TextStyle(color: Colors.white)),
                onTap: () {
                  //
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts, color: Colors.white),
                title: Text('CONTACT US', style: TextStyle(color: Colors.white)),
                onTap: () {

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text('ABOUT', style: TextStyle(color: Colors.white)),
                onTap: () {
                  //
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF800000),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.white,
                onSurface: Colors.white.withOpacity(0.7),
              ),
              textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ).copyWith(
                bodySmall: TextStyle(color: Colors.white.withOpacity(0.9)),
              ),
              splashColor: Colors.white.withOpacity(0.12),
              highlightColor: Colors.white.withOpacity(0.1),

            ),
            child: NavigationBar(
              onDestinationSelected: _onItemTapped,
              selectedIndex: _selectedIndex,
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.event),
                  icon: Icon(Icons.event_outlined),
                  label: 'Events',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.school),
                  icon: Icon(Icons.school_outlined),
                  label: 'Academics',
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: pageContents,
            ),
          ),
        ],
      ),
    );
  }
}