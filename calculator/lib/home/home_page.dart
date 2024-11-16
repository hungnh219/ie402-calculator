import 'package:calculator/home/widgets/keyboard_custom.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late List<String> history;
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    history = [];
    _controller = TextEditingController();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      if (prefs.containsKey('history')) {
        setState(() {
          history = prefs.getStringList('history')!;
        });
      }
    });
    // prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.white54,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // textInputAction: TextInputAction.done,
                        style: const TextStyle(fontSize: 28),
                        controller: _controller,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _controller.text = _controller.text.substring(0, _controller.text.length - 1);
                              });
                            },
                            icon: const Icon(Icons.backspace),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),

                    Expanded(child: ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.text = history[index].split('=')[0];
                            });
                          },
                          child: ListTile(
                            title: Text(history[index]),
                          ),
                        );
                      },
                    )),
                  ],
                )
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  // mainAxisSpacing: 20,
                  crossAxisCount: 4,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('7');
                      },
                      child: const Text('7', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('8');
                      },
                      child: const Text('8', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('9');
                      },
                      child: const Text('9', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        changeValue('+');
                      },
                      child: const Text('+', style: TextStyle(color: Colors.white, fontSize: 32),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('4');
                      },
                      child: const Text('4', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('5');
                      },
                      child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('6');
                      },
                      child: const Text('6', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        changeValue('-');
                      },
                      child: const Text('-', style: TextStyle(color: Colors.white, fontSize: 32),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('1');
                      },
                      child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('2');
                      },
                      child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('3');
                      },
                      child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        changeValue('*');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: const Text('*', style: TextStyle(color: Colors.white, fontSize: 24),),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey
                      ),
                      onPressed: () {
                        changeValue('0');
                      },
                      child: const Text('0', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        clearCalculator();
                      },
                      child: const Text('AC', style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        // Handle addition
                        calculateExpress();
                      },
                      child: const Text('=', style: TextStyle(color: Colors.white, fontSize: 32),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                      ),
                      onPressed: () {
                        changeValue('/');
                      },
                      child: const Text('/', style: TextStyle(color: Colors.white, fontSize: 32),),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearCalculator () {
    setState(() {
      _controller.text = '';
    });
  }

  void changeValue(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void calculateExpress() {
    try {
      String expression = _controller.text;
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      int ans = eval.toInt();

      print (exp);
      print (expression);

      if (expression.contains("++") || expression.contains("--")) {
        setState(() {
          _controller.text = 'Error';
        });
        return;
      }

      setState(() {
        if ((eval - ans).abs() < 1e-10) {
          _controller.text = ans.toString();
          history.add(expression + '=' + ans.toString());
        } else {
          _controller.text = eval.toString();
          history.add(expression + '=' + eval.toString());
        }
        // _controller.text = ans.toString();
      });
    } catch (e) {
      setState(() {
        history.add(_controller.text + '=Error');
        _controller.text += ' : Error expression';
      });
    }
  }
}
