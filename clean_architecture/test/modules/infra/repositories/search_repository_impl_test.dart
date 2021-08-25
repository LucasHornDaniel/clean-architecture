
import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class SearchRepositoryMock extends Mock implements SearchDatasource{}



main() {
  final datasource = SearchRepositoryMock();
  final repository = SearchRepositoryImpl(datasource);


  test('Deve Retornar uma lista de ResultSearch', () async {

    when(datasource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("Lucas");
    expect(result | null, isA<List<ResultSearch>>());
    
  });


   test('Deve Retornar uma error se o datasource falhar', () async {

    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("Lucas");
    expect(result.fold(id, id), isA<DatasourceError>());
    
  });
}