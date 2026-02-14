import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/my_app.dart';
import 'injection_container.dart' as di;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
