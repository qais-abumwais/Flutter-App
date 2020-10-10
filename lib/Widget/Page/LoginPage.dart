
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    int _counter = 0;

    void _incrementCounter() {
        setState(() {
            _counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text(""),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(
                        'You have pushed the button this many times:',
                    ),
                    Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline4,
                    ),
                ],
            ),
        ),
        floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}