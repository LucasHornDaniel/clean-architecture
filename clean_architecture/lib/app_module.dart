
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_block.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/search/extenal/datasources/github_datasource.dart';
import 'modules/search/infra/repositories/search_repository_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
      Bind((i) => Dio()),
      Bind((i) => GithubDatasource(i())),
      Bind((i) => SearchRepositoryImpl(i())),
      Bind((i) => SearchByTextImpl(i())),
      Bind((i) => SearchBloc(i())),

  ];

 

  @override
   List<ModularRoute> get routes => [
    ChildRoute('/', child: (_,args) => SearchPage()),
    
  ];


   

}