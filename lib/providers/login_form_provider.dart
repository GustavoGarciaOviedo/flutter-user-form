import 'package:flutter/material.dart';

class LoginFormProvider extends  ChangeNotifier {

  //Se crea la llave gloval para utilizar el key, y se crea el objeto que corresponda al formState, 
  //por que esta en el form su  fuera en el scaffol donde lo fuera a utilizar se llamaria scaffolState
  GlobalKey <FormState> formKey = GlobalKey();//a este accedo desde la clase login_screen

  String email='';
  String password='';
  
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value){
    this._isLoading = value;
    notifyListeners();//cuando se modifique va a llamr el arbol de widges y va anotificar que cambio
  }


//metodo que me va a decir si el formulario es valido o no
bool isValidForm(){

  print(formKey.currentState?.validate());
  print('$email-$password');//para verificar que capura estos datos,, no es necesario estos datos pero como ejercicios 
  //si existe un estado actual es verdadero si no falso, para el caso: si se cumple con la regla de los input 
  return formKey.currentState?.validate()??false;
}

  
}