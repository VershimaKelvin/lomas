import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lomas/database_helper.dart';

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

  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(

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
                controller: controller2,
                maxLines: 1,
                showCursor: true,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Weight(Numbers Only)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: controller3,
                maxLines: 1,
                showCursor: true,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'ID to delete',
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
                child: TextButton(
                    onPressed: ()async{
                      String name = controller.text;
                      int age=int.parse(controller2.text);
                      int id =await  DatabaseHelper.instance.insert(
                          {
                            'Age': age,
                            'name':name
                          }
                          );
                      print('this is the id of the item inserted into the database $id');
                      controller.clear();
                      controller2.clear();
                    },
                    child: const Text(
                        'Add Workout',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
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
                child: TextButton(
                  onPressed: ()async{
                    List<Map<String,dynamic>> row =await DatabaseHelper.instance.queryAll();
                    print(row);
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
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
                child: TextButton(
                  onPressed: ()async{
                   int deleted = await DatabaseHelper.instance.delete(int.parse(controller3.text));
                   print(deleted);
                   controller3.clear();
                  },
                  child: const Text(
                    'Delete row',
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
