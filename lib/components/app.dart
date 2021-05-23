import 'package:card_memory/components/importer.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);
  static const String _title = 'Card Memory';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}
