import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 10,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller:  controller,
                maxLines: 1,
                showCursor: true,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Rep Scheme',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller:  controller,
                maxLines: 1,
                showCursor: true,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Weight(Numbers Only)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50,50,50,0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const TextButton(
                    onPressed: null,
                    child: Text(
                        'Add Workout',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
