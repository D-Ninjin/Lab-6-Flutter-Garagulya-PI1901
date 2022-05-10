import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Главная',
      
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        shadowColor: Colors.amber,
        backgroundColor: Colors.amber,
        title: const Text('Главная'),
      ),
      body: const Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      
      onPressed: () {
         
        _navigateAndDisplaySelection(context);
      },
      style: ElevatedButton.styleFrom(
                primary: Colors.amber,),
      
      child: const Text('Приступить к выбору!'),
    );
  }

  
  void _navigateAndDisplaySelection(BuildContext context) async {
   
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

  
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Приступить к выбору'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.pop(context, 'Да!');
                },
                style: ElevatedButton.styleFrom(
                primary: Colors.amber,),
                child: const Text('Да!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.pop(context, 'Нет.');
                },
                style: ElevatedButton.styleFrom(
                primary: Colors.amber,),
                child: const Text('Нет.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}