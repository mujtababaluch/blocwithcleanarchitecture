import 'package:blocwithcleanarchitecture/src/features/Home/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_bloc.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
         if (state is TodoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
      },
      builder: (context, state) {
        state is TodoLoading ?Center(child: CircularProgressIndicator())
        : state is TodoLoaded ? ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
           return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title ?? ''),
                  trailing: Icon(
                    (todo.completed ?? false) ? Icons.check : Icons.close,
                    color:     (todo.completed ?? false) ? Colors.green : Colors.red,
                  ),
                );
              },
            );
          },
        ) :state is TodoError ? Center(child: Text(state.message)) :SizedBox.shrink();
                  return Center(child: Text('No todos available.'));

      }, );
  }
}