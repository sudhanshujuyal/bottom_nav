import 'package:bottom_nav/blocs/bottom_navigation_bloc.dart';
import 'package:bottom_nav/blocs/bottom_navigation_state.dart';
import 'package:bottom_nav/pages/first_page.dart';
import 'package:bottom_nav/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bottom_navigation_event.dart';


class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation with BLoC'),
      ),

      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        // bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return FirstPage(text: state.text);
          }
          if (state is SecondPageLoaded) {
            return SecondPage(number: state.number!);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          // bloc: bottomNavigationBloc,
          builder: (BuildContext context, BottomNavigationState state) {
            return BottomNavigationBar(
              currentIndex: bottomNavigationBloc.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  title: Text('First'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive, color: Colors.black),
                  title: Text('Second'),
                ),
              ],
              onTap: (index) => bottomNavigationBloc.add(PageTapped(index: index)),
            );
          }
      ),
    );
  }
}
