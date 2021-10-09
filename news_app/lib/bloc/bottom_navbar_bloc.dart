import 'dart:async';

enum NavBarItem { Home, Source, Search }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();
  NavBarItem defaultItem = NavBarItem.Home;

  Stream<NavBarItem> get itemSearch => _navBarController.stream;
   void pickItem(int i){
     switch (i){
       case 0:
       _navBarController.sink.add(NavBarItem.Home);
       break;
       case 1:
         _navBarController.sink.add(NavBarItem.Source);
         break;
       case 2:
         _navBarController.sink.add(NavBarItem.Search);
         break;

     }
   }
close(){
     _navBarController?.close();
}
}
