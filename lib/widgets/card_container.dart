import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(//envuelto es este padiin para signarle los bordes
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        //height: 300,
        decoration: _createCardShape(),
        child: child ,
      ),
    );
  }


//solo para la decoracion de ese container
  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 15,
        offset: Offset(3,8),
      )
    ]

  );
}