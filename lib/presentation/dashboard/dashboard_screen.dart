import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/movie_screen.dart';
import 'package:movie_app/presentation/home/tv_show_screen.dart';
import 'package:movie_app/utils/sizes.dart';
import 'package:movie_app/utils/styles/color_palettes.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = '/';
  final String title;

  const DashBoardScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late PageController _pageController;
  int _page = 0;

  void _navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const <Widget>[
          MovieScreen(),
          TvShowScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.location_searching,
          color: ColorPalettes.white,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: ColorPalettes.setActive),
          ),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: Sizes.dp8(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color:
                _page == 0 ? ColorPalettes.darkAccent : ColorPalettes.grey,
                icon: const Icon(Icons.movie_creation),
                onPressed: () => _navigationTapped(0),
              ),
              IconButton(
                color:
                _page == 1 ? ColorPalettes.darkAccent : ColorPalettes.grey,
                icon: const Icon(Icons.live_tv),
                onPressed: () => _navigationTapped(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
