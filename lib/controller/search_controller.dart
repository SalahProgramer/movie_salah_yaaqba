import 'package:flutter/cupertino.dart';

class PageSearchController extends ChangeNotifier{

  TextEditingController textSearch=TextEditingController();
String text="";


Future<void> changeText(String changeText)async{
  text=changeText.trim();
  notifyListeners();
}



}