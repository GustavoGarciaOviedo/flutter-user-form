import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:flutter_user_form/screens/screens.dart';
import 'package:flutter_user_form/providers/providers.dart';
import '../ui/input_decoration.dart';
import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  static const name = 'home-screen';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      icon: Icons.person_pin,
      child: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: [
            const SizedBox(height: 230),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Datos personales',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 20),
                  _UserForm(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('crea un usuario', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    ));
  }
}

TextEditingController _controller = TextEditingController();

class _UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userForm = Provider.of<UserFormProvider>(context); //TODO:  es el lamado , pilas

    return Form(
        key: userForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction, 
          child: Column(
          children: [
            //NOMBRE
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Escribe aqui tu nombre',
                  prefixIcon: Icons.supervised_user_circle_rounded),
              onChanged: ((value) => userForm.name = value),
              validator: (value) {
                String pattern = r'^[a-zA-Z\s]{2,25}$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'min 2 max 25 letras ';
              },
            ),
            const SizedBox( height: 10,),

            //APELLIDO
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Escribe aqui tu apellido',
                  prefixIcon: Icons.supervised_user_circle_outlined),
              onChanged: ((value) => userForm.lastName = value),
              validator: (value) {
                String pattern = r'^[a-zA-Z\s]{2,25}$';
                RegExp regExp =  RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'min 2 max 25 letras';
              },
            ),
            const SizedBox( height: 10, ),

            //FECHA NACIMIENTO
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Fecha de nacimiento',
                hintText: 'DD/MM/AAAA',
                prefixIcon: Icons.calendar_month_outlined,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
              ],
              onChanged: (value) {
                userForm.birthdate = _controller.text;
                String text =
                    value.replaceAll('/', ''); // eliminamos las barras
                if (text.length >= 4) {
                  // agregamos la primera barra si se ingresaron al menos 4 caracteres
                  text = text.substring(0, 2) + '/' + text.substring(2);
                }
                if (text.length >= 7) {
                  // agregamos la segunda barra si se ingresaron al menos 7 caracteres
                  text = text.substring(0, 5) + '/' + text.substring(5);
                }
                if (text.length > 10) {
                  // si se ingresaron más de 10 caracteres, eliminamos los extras
                  text = text.substring(0, 10);
                }
                if (text != value) {
                  // actualizamos el valor del campo si se modificó el texto
                  _controller.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                }
              },
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ingresa tu fecha de nacimiento';
                }

                var parts = value.split('/');
                if (parts.length != 3) {
                  
                  return 'Por favor, ingresa una fecha válida';
                }

                var day = int.tryParse(parts[0]);
                var month = int.tryParse(parts[1]);
                var year = int.tryParse(parts[2]);

                if (day == null || day > 31 || day < 1) {
                  return 'ingresa un día válido (01-31)';
                }

                if (month == null || month > 12 || month < 1) {
                  return 'ingresa un mes válido (01-12)';
                }

                if (year == null ||
                    year > DateTime.now().year ||
                    year < 1900) {
                  return 'ingresa un año válido (1900-2023)';
                }

                return null;
              },
            ),
            const SizedBox( height: 10,),

            //DIRECCION

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecorations.authInputDecoration(
                  labelText: 'Direccion',
                  hintText: 'Escribe aqui tu direccion',
                  prefixIcon: Icons.person_pin_circle_sharp),
              onChanged: (value) => userForm.addresses = [value],
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'la direccion debe tener minimo 6 caracteres';
              },
            ),
            const SizedBox(height: 20),

            // FloatingActionButton(
            //   onPressed: () {
            //     // Valida el formulario
            //     if (userForm.isValidForm()) {
            //       // Guarda los datos del formulario
            //       userForm.formKey.currentState!.save();
            //       // Agrega una nueva dirección vacía a la lista
            //       userForm.addAddress('');
                  
            //     }
            //   },
            //   child: Icon(Icons.add),
            // ),

            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.pink[200],
              color:const Color.fromARGB(254, 247, 2, 190),
              elevation: 0,
              onPressed: userForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!userForm.isValidForm()){
                        return;
                        } 
                      userForm.isLoading = true; //cuando se oprima el boton y se cumplan las validaciones cambia a
                      //true y entonces se muestra el texto 'espere'en el boton
                      await Future.delayed(const Duration(seconds: 2));//simulando peticion

                      userForm.isLoading = false;

                      Navigator.pushNamed((context), UserDataScreen.name);
                    },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: Text(
                  userForm.isLoading 
                  ? 'Espere....' 
                  : 'Registrar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
