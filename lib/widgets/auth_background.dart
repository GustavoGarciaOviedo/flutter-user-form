import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Color? color;
  final Widget child;
  final IconData? icon ;


  const AuthBackground({super.key, this.color, required this.child,  this.icon });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _PinkBox(),
           if (icon != null) _HeaderIcon(icon: icon!),
          child  //estara dentro del stack el widget que pase por parametro
        ]),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;

  const _HeaderIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(//guarda un espacio prudente si hay una camara o sensores en la pantalla
      child: SizedBox(
        width: double.infinity,
        child: 
        Icon(icon, color: Colors.white, size: 100,),
      ),
    );
  }
}


//es la parte superiror del stack
class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.4,
      decoration: _pinkBoxDecoration(),
      child: Stack(
        children: const [
          Positioned( top: 10, left: -30,child:_Bubble(), ),//ubicacion a cada burbuja bubble
          Positioned( top: 90, left: 80,child:_Bubble(), ),
          Positioned( top: -40, right: -30,child:_Bubble(), ),
          Positioned( bottom: 10, left: -30,child:_Bubble(), ),
          Positioned( bottom: 90, right: 30,child:_Bubble(), ),
        ]),
    );
  }

  BoxDecoration _pinkBoxDecoration() => const BoxDecoration(
    gradient:  LinearGradient(
      colors: [
        Color.fromARGB(254, 247, 2, 190),
        Color.fromARGB(255, 235, 43, 245)
    ])
  );
}


//creo las burbujas transparentes, como stacks
class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,//dimenciones de la esfera
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),//queda circular con 100
        color:const  Color.fromRGBO(255, 255, 255, 0.13)
      ) ,

    );
  }
}