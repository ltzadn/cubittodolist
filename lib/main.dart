import 'dart:io';

import 'package:cubittodolist/data/models/isar_to_do.dart';
import 'package:cubittodolist/data/repository/isar_to_do_repo.dart';
import 'package:cubittodolist/domain/repository/to_do_repo.dart';
import 'package:cubittodolist/presentation/to_do_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([ToDoIsarSchema], directory: dir.path);

  final isarToDoRepo = IsarToDoRepo(isar);

  runApp(MainApp(toDoRepo: isarToDoRepo));
}

class MainApp extends StatelessWidget {
  final ToDoRepo toDoRepo;

  const MainApp({super.key, required this.toDoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(toDoRepo: toDoRepo),
    );
  }
}
