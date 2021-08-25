import 'package:bloc/bloc.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/states/state.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
class SearchBloc extends Bloc<String, SearchState> implements Disposable {
  final SearchByText searchByText;

  SearchBloc(this.searchByText) : super(const SearchStart());

  @override
  Stream<SearchState> mapEventToState(String textSearch) async* {
    if (textSearch.isEmpty) {
      yield SearchStart();
      return;
    }

    yield const SearchLoading();

    var result = await searchByText(textSearch);
    yield result.fold(
      (failure) => SearchError(failure),
      (success) => SearchSucess(success),
    );
  }



  @override
  void dispose() {
    this.close();
  }
}