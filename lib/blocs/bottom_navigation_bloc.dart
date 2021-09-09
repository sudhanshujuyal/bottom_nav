import 'package:bloc/bloc.dart';
import 'package:bottom_nav/blocs/bottom_navigation_event.dart';
import 'package:bottom_nav/blocs/bottom_navigation_state.dart';
import 'package:bottom_nav/repository/first_page_repo.dart';
import 'package:bottom_nav/repository/second_page_repo.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent,BottomNavigationState>
{
  final FirstPageRepository? firstPageRepository;
  final SecondPageRepository? secondPageRepository;
  int currentIndex=0;
  BottomNavigationBloc({
    this.firstPageRepository,
    this.secondPageRepository
  }) : assert(firstPageRepository != null),
        assert(secondPageRepository != null), super(PageLoading());

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async*
  {
    // TODO: implement mapEventToState
       if(event is AppStarted)
         {
           this.add(PageTapped(index: this.currentIndex));
         }
       if(event is PageTapped)
         {
           this.currentIndex=event.index;
           yield CurrentIndexChanged(currentIndex: this.currentIndex);
           yield PageLoading();
           if(this.currentIndex==0)
             {
               String? data=await _getFirstPageData();
               yield FirstPageLoaded(text: data);
             }
           if(this.currentIndex==1)
             {
               int? data=await _getSecondPageData();
               yield SecondPageLoaded(number:data);
             }
         }
  }
  Future<String?> _getFirstPageData() async {
    String? data = firstPageRepository!.data;
    if (data == null) {
      await firstPageRepository!.fetchData();
      data = firstPageRepository!.data;
    }
    return data;
  }

  Future<int?> _getSecondPageData() async {
    int? data = secondPageRepository!.data;
    if (data == null) {
      await secondPageRepository!.fetchData();
      data = secondPageRepository!.data;
    }
    return data;
  }

}