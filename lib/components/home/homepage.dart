import 'package:card_memory/components/importer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController;
  Icon _fabIcon = Icon(
    Icons.videogame_asset,
  );

  int _fabIconNumber = 0;
  bool _clickedCentreFAB = false;

  static List<Widget> _pageList = [
    CommingSoonPage(
        pannelColor: Colors.cyan,
        title: 'Coming Soon...'), // TODO : ranking page
    ReportPage(pannelColor: Colors.green, title: 'Report'),
    SettingsPage(pannelColor: Colors.yellow, title: 'Settings'),
    CommingSoonPage(
        pannelColor: Colors.purple,
        title:
            'Coming Soon...'), // TODO : other page. "About Page" and "Email Page" are essential functions.
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      if (!_clickedCentreFAB) {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  void _onPressed() {
    setState(() {
      // change fab icon
      if (_fabIconNumber == 0) {
        _clickedCentreFAB = !_clickedCentreFAB;
        _fabIcon = Icon(Icons.play_arrow);
        _fabIconNumber = 1;
      } else if (_fabIconNumber == 1) {
        _fabIcon = Icon(Icons.stop);
        _fabIconNumber = 2;
      } else {
        _clickedCentreFAB = !_clickedCentreFAB;
        _fabIcon = Icon(Icons.videogame_asset);
        _fabIconNumber = 0;
      }
    });
  }

  Widget _createGamePlayPage() {
    return GamePage(clickedCentreFAB: _clickedCentreFAB);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (_) => CounterModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _pageList,
            ),
            _createGamePlayPage(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<CounterModel>(builder: (_, model, __) {
          return FloatingActionButton(
            onPressed: () =>
                {_onPressed(), model.setFabIconNumber(_fabIconNumber)},
            tooltip: 'Play',
            child: _fabIcon,
          );
        }), // This
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered), label: "Ranking"),
            BottomNavigationBarItem(
                icon: Icon(Icons.description), label: "Report"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Other"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
        ),
      ),
    );
  }
}
