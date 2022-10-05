import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization_demo_app/MyLocalizations.dart';
import 'package:localization_demo_app/second_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return MyLocalizations.of(context)!.title.toString();
      },
      // onGenerateTitle: (BuildContext context) =>
      //     MyLocalizations.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        MyLocalizationsDelegate(),
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) {
          return MyHomePage(
              title: MyLocalizations.of(context)!.title.toString());
        },
        '/secondpage': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context)!.title.toString()),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 550,
            // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  MyLocalizations.of(context)!.find('info'),
                ),
                const SizedBox(
                  height: 19,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'name',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Date',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));

                    if (pickedDate != null) {
                      dateInputController.text =
                          DateFormat('dd MMMM yyyy').format(pickedDate);
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Leave your Message',
                    labelText: 'Message',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 160.0,
                  height: 50.0,
                  // padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0.0,
                    ),
                    child: const Text('Submit'),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyLocalizations.load(const Locale('en', 'US'));
                        });
                      },
                      child: const Text('ENGLISH'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
