import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 249, 255),
        appBar: AppBar(
          title: const Text('Currency Converter'),
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(200, 117, 2, 1)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter amount in USD',
                  hintStyle: TextStyle(
                    color:Colors.black
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on,
                  ),
                  prefixIconColor:  Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  const Color.fromARGB(255, 1, 105, 51)
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  const Color.fromARGB(255, 1, 105, 51)
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

}