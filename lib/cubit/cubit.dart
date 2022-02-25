// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country' : 'eg',
        'category' : 'business',
        'apiKey' : '525f635890d140759bcf53a367f6ad71',
      },
    ).then((value) {
      business = value.data['articles'];
      print('Get Business Data Successfully');
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print('Error When Get Business Data ===> ${error.toString()}');
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : '525f635890d140759bcf53a367f6ad71',
        },
      ).then((value) {
        sports = value.data['articles'];
        print('Get Sports Data Successfully');
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print('Error When Get Sports Data ===> ${error.toString()}');
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());

    if(science.isEmpty){
      DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '525f635890d140759bcf53a367f6ad71',
        },
      ).then((value) {
        science = value.data['articles'];
        print('Get Sports Data Successfully');
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print('Error When Get Sports Data ===> ${error.toString()}');
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetScienceLoadingState());
    }
  }


  List search = [];
  void getSearch(String value) {

    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      path: 'v2/everything',
      query: {
        'q' : value,
        'apiKey' : '525f635890d140759bcf53a367f6ad71',
      },
    ).then((value) {
      emit(NewsGetSearchSuccessState());
      search = value.data['articles'];
      print('Get Search Data Successfully');
    }).catchError((error){
      print('Error When Get Search Data ===> ${error.toString()}');
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


  bool isDark = false;
  void changeMode({
  bool? isdark,
}){
    if(isdark != null) {
      isDark = isdark;
      emit(NewsChnageModeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.putBoolean(value: isDark).then((value) {
        emit(NewsChnageModeState());
      });
    }

  }
}
