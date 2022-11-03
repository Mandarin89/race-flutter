import 'package:flutter/material.dart';
import 'package:race/enviroment.dart';
import 'package:race/ui/widgets/app/race_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: Enviroment.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  const raceApp = RaceApp();
  runApp(raceApp);
}
