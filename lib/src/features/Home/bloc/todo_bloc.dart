import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:blocwithcleanarchitecture/src/domain/use_cases/get_todos_usecase.dart';
import 'package:blocwithcleanarchitecture/src/features/Home/bloc/todo_event.dart';
import 'package:blocwithcleanarchitecture/src/features/Home/bloc/todo_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../../core/network/network_info.dart';

class TodoBloc extends Bloc<TodoEvent , TodoState> {

  final network = injector<NetworkInfoI>();
  final connectivityResult = ConnectivityResult.none;
  final getTodosUsecase = injector<GetTodosUsecase>();
    
  TodoBloc():super(TodoInitial()){
    on<FetchTodos>((event, emit) {

    },);
  }
  void fetchTodosapicall(FetchTodos event, Emitter<TodoState> emit)async {
     emit(TodoLoading());
     final isConnected = await network.isConnected();
    if (!isConnected) {
      emit(TodoError("Please connect your device to wifi or mobile network"));
      return;
    }
    final result = await getTodosUsecase.invoke();
    _handleFetchResult(result, emit);
}
  Future<void> _handleFetchResult(Either<Failure , List<TodoModel>> result, Emitter<TodoState> emit) async {
    result.fold(
      (failure){
        emit(TodoError(failure.message));
      },
       (todos) => emit(TodoLoaded(todos)),
    );
  }
}