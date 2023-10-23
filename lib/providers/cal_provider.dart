import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveStringToLocalStorage(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();
  final scrollController = ScrollController();
  String result = '';
  setValue(String value){

    String str = compController.text;
    switch(value){
      case 'π':
        compController.text += 'pi';
        break;
      case 'AC':
        compController.clear();
        break;
      case 'DEL':
        str = str.substring(0, str.length - 1);
        compController.text = str;
        break;
      case '×':
        compController.text += "*";
        break;
      case '÷':
        compController.text += "/";
        break;
      case '√':
        compController.text += "sqrt";
        break;
      case "=":
        compute();
        break;
      case "ans":
        compController.text = result;
        break;
      default:
        compController.text += value;
      
      
    }
    compController.selection = TextSelection.fromPosition(
      TextPosition(offset: compController.text.length)
    );
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  
  
  compute(){
    String text = compController.text;
    compController.text = text.interpret().toString();
    result = text.interpret().toString();
    saveStringToLocalStorage('result', compController.text);
    notifyListeners();
  }

  @override
  void dispose(){
    compController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}