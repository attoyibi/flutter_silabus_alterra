import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/contact_model.dart';
import 'bloc/contact_bloc.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ContactBloc())],
      child: MaterialApp(
        title: 'CRUD using Bloc',
        home: Home(),
      ),
    );
  }
}
