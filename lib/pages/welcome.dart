import 'package:flutter/material.dart';
import 'package:myroomwheather/pages/climate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200, // Light blue for the sky
              Colors.grey.shade300, // Light grey for clouds
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: 
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 150),),
              Text(
                'Bem Vindo',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 80),),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CurrWheather()),
                  );
                }, 
                child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
              )
            ],
          )
        )
      );

  }
}