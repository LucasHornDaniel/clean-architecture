import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_block.dart';
import 'package:clean_architecture/modules/search/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class SearchByTextMock extends Mock implements SearchByText{}

main() {
  
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);


  test("Deve retornar os estados na ordem correta",() {
    when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(bloc, emitsInOrder([
      
      isA<SearchLoading>(),
      isA<SearchSucess>(),
    ]));
    bloc.add("Lucas");
  });

   test("Deve retornar error",() {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));
    expect(bloc, emitsInOrder([
      
      isA<SearchLoading>(),
      isA<SearchError>(),
    ]));
    bloc.add("Lucas");
  });
}