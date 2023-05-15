import 'package:flutter/material.dart';

class LoginFormProvider extends  ChangeNotifier {

  GlobalKey <FormState> formKey = GlobalKey();

  String email='';
  String password='';
  
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value){
    this._isLoading = value;
    notifyListeners();
  }



bool isValidForm(){
  return formKey.currentState?.validate()??false;
}

  
}