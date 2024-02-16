import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hesiod/domain/constants/hiveboxconstants.dart';
import 'package:hesiod/domain/models/utility/environment.dart';
import 'package:hesiod/infrastructure/app_router.dart';
import 'package:hesiod/infrastructure/servicelocator.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env.dev');
  Hive.initFlutter();
  await Hive.openBox(HiveBoxConstants.userBox);
  runApp(MyApp(ServiceLocator()));
}

class MyApp extends StatefulWidget {
  final ServiceLocator _serviceLocator;
  const MyApp(this._serviceLocator, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  void initState() {
    super.initState();
    widget._serviceLocator.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: router,
        title: 'Hesiod',
        debugShowCheckedModeBanner: Environment.debugBanner,
        supportedLocales: const [Locale('en', 'GB')],
        locale: const Locale('en', 'GB'));
  }
}
