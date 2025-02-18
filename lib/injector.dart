import 'package:blocwithcleanarchitecture/src/data/data_sources/login_data_source_impl.dart';
import 'package:blocwithcleanarchitecture/src/data/repositories/login_repository_impl.dart';
import 'package:blocwithcleanarchitecture/src/domain/data_sources/login_data_source.dart';
import 'package:blocwithcleanarchitecture/src/domain/repositories/login_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import 'src/core/network/network_info.dart';
import 'src/data/api/dio_client.dart';
import 'src/data/data_sources/todo_data_source_impl.dart';
import 'src/data/repositories/todo_repository_impl.dart';
import 'src/domain/data_sources/todo_data_source.dart';
import 'src/domain/repositories/todo_repository.dart';
import 'src/domain/use_cases/get_todos_usecase.dart';
import 'src/domain/use_cases/login_usecase.dart';

GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
    // Connectivity and Network
  injector.registerLazySingleton<Connectivity>(() => Connectivity(),);

  injector.registerLazySingleton<NetworkInfoI>(() => NetworkInfo(connectivity: injector()),);
    
  // Dio Client
   injector.registerLazySingleton<DioClient>(() => DioClient(),);

    //data sources
  injector.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl(client: injector()),);
  injector.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(client: injector()),);

  //repositories
   injector.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(dataSource: injector()),);
   injector.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(dataSource: injector()),);

  //usecases
   injector.registerLazySingleton<GetTodosUsecase>(() => GetTodosUsecase(repository: injector()),);
   injector.registerLazySingleton<LoginUsecase>(() => LoginUsecase(injector()),);
}