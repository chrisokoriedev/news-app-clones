import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/bottom_navbar_bloc.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/style/theme.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Style.Colors.mainColor,
          title: Text(
            "NewApp",
            style: TextStyle(color: Colors.white),
          ),
          elevation:0.0,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemSearch,
          initialData: _bottomNavBarBloc.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.Home:
                return HomeScreen();
              case NavBarItem.Source:
                return testScreen();
              case NavBarItem.Search:
                return testScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemSearch,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0,
                    blurRadius: 10.0,
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Style.Colors.grey,
                selectedFontSize: 9.5,
                unselectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Colors.mainColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                    label:  ("Home"),
                    icon:  Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home)
                  ),
                  BottomNavigationBarItem(
                      label:  ("Sources"),
                      icon:  Icon(EvaIcons.gridOutline),
                      activeIcon: Icon(EvaIcons.grid)
                  ),
                  BottomNavigationBarItem(
                      label:  ("Search"),
                      icon:  Icon(EvaIcons.searchOutline),
                      activeIcon: Icon(EvaIcons.search)
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget testScreen(){
    return Container(
      color:  Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Test Screen"),
        ],
      ),
    );
  }
}
