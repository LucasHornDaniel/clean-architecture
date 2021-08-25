import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/repositories/serch_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';



abstract class SearchByText{

 Future<Either<FailureSearch, List<ResultSearch>>>call(String searchText);
  
}

@Injectable(singleton: false)
class SearchByTextImpl implements SearchByText {

  final SearchRepository  repository;

  SearchByTextImpl(this.repository);
 

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String textSearch) async {
    var option = optionOf(textSearch);
    return option.fold(() => Left(InvalidTextError()), (text) async {
      var result = await repository.search(textSearch);
      return result.where((r) => r.isNotEmpty, () => InvalidTextError());
    });
  }
}