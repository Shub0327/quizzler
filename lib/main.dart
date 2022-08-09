import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Icon> scorekeeper = [];
List<String> quetions =[
  'africans are black',
  'sky is pink',
  'valorant is not good game'
];
List<bool> answers=[
  true,
  false,
  false,
];
int quetion_number=0;

void correct()
{
  scorekeeper.add(
    const Icon(
      Icons.check,
      color: Colors.green,
    ),
  );
}
void wrong()
{
  scorekeeper.add(
    const Icon(
      Icons.close,
      color: Colors.red,
    ),
  );
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                    child: Text(quetions[quetion_number]),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                             // bool correct_answer;
                              if (answers[quetion_number]==true) {
                                correct();
                              }
                              else
                                {
                                  wrong();
                                }
                              setState(() {
                               quetion_number++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey[800],
                            ),
                            child: const Text(
                              "True",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              if (answers[quetion_number]==false) {
                                correct();
                              }
                              else
                              {
                                wrong();
                              }
                              setState(() {
                                quetion_number++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey[800],
                            ),
                            child: const Text(
                              "False",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  children: scorekeeper,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
