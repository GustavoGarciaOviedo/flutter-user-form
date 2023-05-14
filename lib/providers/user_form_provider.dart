import 'package:flutter/material.dart';



class UserFormProvider extends  ChangeNotifier {

  GlobalKey <FormState> formKey = GlobalKey();//a este accedo desde la clase login_screen

  String name='';
  String lastName='';
  String birthdate='';
  String address='';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

bool isValidForm(){
return formKey.currentState?.validate()??false;
}
}