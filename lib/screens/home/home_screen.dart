import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_weather_app/screens/landing/landing_page.dart';
import 'package:local_weather_app/widgets/localizatio_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  // final FloatingSearchBarController _searchBarController =
  // FloatingSearchBarController();

  // final ColorController colorController = Get.find();

  String _userLocation = "Chargement...";
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  Future<void> _loadUserLocation() async {
    String location = await _locationService.getUserLocation();
    setState(() {
      _userLocation = location;
    });
  }

  // int _index = 0;
  // int get index => _index;
  // set index(int value) {
  //   _index = min(value, 2);
  //   _index == 2 ? _searchBarController.hide() : _searchBarController.show();
  //   setState(() {});
  // }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool _isSearching = false;

  // Widget buildSearchBar() {
  //   return
  //    FloatingSearchBar(
  //     // ignore: dead_code
  //     height: _isSearching ? 56 : 0,
  //     controller: _searchBarController,
  //     hint: 'Rechercher...',
  //     progress: true,
  //     textInputType: TextInputType.none,
  //     // backgroundColor: Colors.white.withOpacity(0.3),
  //     // backdropColor: colorController.currentColor.withOpacity(0.3),
  //     implicitCurve: Curves.linear,
  //     transitionDuration: const Duration(milliseconds: 500),
  //     transitionCurve: Curves.easeInOut,
  //     physics: const BouncingScrollPhysics(),
  //     axisAlignment: 0.0,
  //     openAxisAlignment: 0.0,
  //     debounceDelay: const Duration(milliseconds: 500),
  //     onFocusChanged: (isFocused) {
  //       setState(() {
  //         _isSearching = isFocused;
  //       });
  //     },
  //     onQueryChanged: (query) {
  //       debugPrint('Requête de recherche: $query');
  //     },
  //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
  //     transition: CircularFloatingSearchBarTransition(),
  //     actions: [
  //       FloatingSearchBarAction.searchToClear(
  //         showIfClosed: false,
  //       ),
  //     ],
  //     builder: (BuildContext context, Animation<double> transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Material(
  //           color: Colors.white,
  //           elevation: 4.0,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: List.generate(
  //               5,
  //               (index) => ListTile(
  //                 title: Text('Suggestion $index'),
  //                 onTap: () {
  //                   _searchBarController.close();
  //                   debugPrint('Suggestion $index sélectionnée.');
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocalWeatherApp'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          LandingPage(scrollController: _scrollController),
          // ProductListPage(),
          // ProfileScreen(scrollController: _scrollController),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: DigiPublicAColors.whiteColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_rounded),
            label: 'Magasin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
