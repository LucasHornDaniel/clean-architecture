 import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';

abstract class SearchState{


}

class SearchSucess implements SearchState{
  final List<ResultSearch> list;

  SearchSucess(this.list);
}


class SearchStart implements SearchState{
  const SearchStart();
}

class SearchLoading implements SearchState{
  const SearchLoading();
}

class SearchError implements SearchState{
  
  final FailureSearch error;

  SearchError(this.error);



}