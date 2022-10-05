import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  'Thank you for entering your informations on the previous page, your request is under review'),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(onPressed: null, child: Text("Go Back"))
            ],
          ),
        ),
      ),
    );
  }
}
