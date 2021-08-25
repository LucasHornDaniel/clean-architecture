import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/repositories/serch_repository.dart';
import 'package:clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';


class SearchRepositoryImpl implements SearchRepository{

  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);



  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    List<ResultSearch> list;


    try{
      list = (await datasource.getSearch(searchText)).cast<ResultSearch>();
    }catch(e){
      return left(e());
    }

    return list == null ? left(DatasourceError()): right(list);



  }
}

