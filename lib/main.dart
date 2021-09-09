import 'package:bottom_nav/blocs/bottom_navigation_bloc.dart';
import 'package:bottom_nav/repository/first_page_repo.dart';
import 'package:bottom_nav/repository/second_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_screen.dart';
import 'blocs/bottom_navigation_event.dart';
class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  // Bloc.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(
            firstPageRepository: FirstPageRepository(),
            secondPageRepository: SecondPageRepository(),
          )
            ..add(AppStarted()),
          child: AppScreen(),
        )
    );
  }
}