import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'page_provider_state.dart';

class PageProviderCubit extends Cubit<PageProviderState> {
  PageProviderCubit() : super(PageProviderState.initial());

  // switch method to change the page
  void switchPage(PageItem pageItem) {
    switch (pageItem) {
      case PageItem.home:
        emit(state.copyWith(pageItem: PageItem.home, index: 0));
        break;
      case PageItem.inventory:
        emit(state.copyWith(pageItem: PageItem.inventory, index: 1));
        break;
      case PageItem.settings:
        emit(state.copyWith(pageItem: PageItem.settings, index: 2));
        break;
    }
  }
}
