import 'package:flutter/material.dart';

import 'app.dart';
import 'di/di_service.dart';

///Global connectivity var
var isConnected = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getServices();
  runApp(const KhelooAPP());
}