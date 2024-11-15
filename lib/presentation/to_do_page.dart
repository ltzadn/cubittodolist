import 'package:cubittodolist/domain/repository/to_do_repo.dart';
import 'package:cubittodolist/presentation/to_do_cubit.dart';
import 'package:cubittodolist/presentation/to_do_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoPage extends StatelessWidget {
  final ToDoRepo toDoRepo;

  const ToDoPage({super.key, required this.toDoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(toDoRepo),
      child: const ToDoView(),
    );
  }
}
