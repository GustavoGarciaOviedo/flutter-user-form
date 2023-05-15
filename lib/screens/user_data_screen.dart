import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_user_form/widgets/widgets.dart';
import 'package:flutter_user_form/providers/providers.dart';


class UserDataScreen extends StatelessWidget {

  static const name = 'user-data-screen';
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: AuthBackground(
        icon: Icons.data_object_outlined,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height:230),
              CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const Text('Usuario registrado',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height:20),
                    _DataForm()
                   
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              MaterialButton(
                 shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      ),
                  color: const Color.fromARGB(254, 247, 2, 190),
                onPressed: () {
                  
                  Navigator.pop(context);
                },
                child: const Text('Volver',style: TextStyle(color: Colors.white)),
              ),
            
            ],
          ),
        ),
      )
    );
  }
}


//CUADRO DE LOGIN
class _DataForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final  loginForm =Provider.of<UserFormProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre:       ${loginForm.name}',softWrap: true,),
          const SizedBox(height: 5,),
          Text('Apellido:       ${loginForm.lastName}',softWrap: true,),
          const SizedBox(height: 5,),
          Text('Nacimiento:  ${loginForm.birthdate}'),
          const SizedBox(height: 5,),
          Text('Direccion:     ${loginForm.addresses}',softWrap: true,),//TODO: hacer el recorrido cuando pueda poblar la lista
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}

