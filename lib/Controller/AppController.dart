import 'package:flutter/cupertino.dart';
import 'package:translate/model/LanguagesModel.dart';

import '../model/TranslateModel.dart';
import '../store/LocalStore.dart';

class AppController extends ChangeNotifier{
  List<TranslateModel> listOfFavourites=[];
  List<TranslateModel> listOfHistory=[];
  LanguagesModel lang=LanguagesModel();
  bool isChangeTheme=false;

 changeTheme(){
    isChangeTheme=!isChangeTheme;
    LocalStore.setTheme(isChangeTheme);
    notifyListeners();
  }

  setTheme(bool theme){
    isChangeTheme=theme;
    notifyListeners();
  }

  //-------------- Favourites ------------//

  addFavourites(TranslateModel model){
    listOfFavourites.add(model);
    LocalStore.setFavourites(model);
    notifyListeners();
  }
  removeFavourites(int index){
    listOfFavourites.removeAt(index);
    LocalStore.removeFavourites(index);
    notifyListeners();
  }
  removeAllFavourites(){
    listOfFavourites.clear();
    LocalStore.removeAllFavourites();
    notifyListeners();
  }

  //-------------- History ------------//

  addHistory(TranslateModel model){
    listOfHistory.add(model);
    LocalStore.setHistory(model);
    notifyListeners();
  }
  removeHistory(int index){
    listOfHistory.removeAt(index);
    LocalStore.removeHistory(index);
    notifyListeners();
  }
  removeAllHistory(){
    listOfHistory.clear();
    LocalStore.removeAllHistory();
    notifyListeners();
  }

  //-------------- Languages ------------//

  addLanguages(LanguagesModel model){
    lang=model;
    LocalStore.setLanguages(model);
    notifyListeners();
  }
//-------------- All ------------//
  clearAllData(){
    listOfHistory.clear();
    listOfFavourites.clear();
    LocalStore.clearAllData();
    notifyListeners();
  }

}

