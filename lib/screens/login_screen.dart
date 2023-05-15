import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_user_form/screens/screens.dart';
import 'package:flutter_user_form/widgets/widgets.dart';
import 'package:flutter_user_form/providers/login_form_provider.dart';
import '../ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {

  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        icon: Icons.login_outlined,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height:230),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('login',style: Theme.of(context).textTheme.headlineSmall,),
                    const SizedBox(height:20),
                    _LoginForm(),

                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      )
    );
  }
}


//CUADRO DE LOGIN
class _LoginForm extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {


    final  loginForm =Provider.of<LoginFormProvider>(context);
    return Form(
     key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration:  InputDecorations.authInputDecoration(
              labelText: 'email',
              hintText: 'tucorreo@mail.com', 
              prefixIcon: Icons.alternate_email_rounded
            ),
            onChanged: ((value) => loginForm.email=value),
            validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  =  RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'tipo de correo erroneo';
              },
          ),
          const SizedBox(height: 20,),

          TextFormField(
            autocorrect: false,
            obscureText: true, 
            keyboardType: TextInputType.name,
            decoration:  InputDecorations.authInputDecoration(
              labelText: 'password',
              hintText: 'xxxxxx', 
              prefixIcon: Icons.key_rounded
            ),
            onChanged: (value) => loginForm.password=value,
              
            validator: (value) {
                if (value != null && value.length >=6) return null;
                return 'la contraseña debe tener minimo 6 caracteres';
            }, 
          ),
          const SizedBox(height: 20),


//TODO: pasar el key global como parametro para optimizar
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.pink[200],
            color: const Color.fromARGB(255, 227, 42, 202),
            elevation: 0,
            
            onPressed: loginForm.isLoading ? null: () async {
             
              FocusScope.of(context).unfocus();
              if(!loginForm.isValidForm())return;
              loginForm.isLoading =  true; 

              await Future.delayed(const Duration(seconds: 2));
              loginForm.isLoading =  false;

              Navigator.pushReplacementNamed((context), UserScreen.name);
            },
           child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Text(
                loginForm.isLoading
                ?'Espere....'
                :'ingresar', 
                style: const TextStyle(color: Colors.white ),),
            ), 
            )
        ],
      )
    );
  }
}

