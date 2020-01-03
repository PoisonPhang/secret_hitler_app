import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// Global app configurations.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret Hitler',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Secret Hitler'),
    );
  }
}

/// HomePage widget class.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// State of HomePage widget.
class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Game Code',
                        hintText: '4 characters',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Plase enter a game code';
                        } else if (value.length > 4) {
                          return 'Please enter a valid gamecode';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: '16 characters or less',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Plase enter a username';
                        } else if (value.length > 16) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // kill james
                          }
                        },
                        color: Colors.yellow,
                        child: Text('Enter The Political Landscape'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
