// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'page_provider_cubit.dart';

enum PageItem {
  home,
  inventory,
  settings,
}

class PageProviderState extends Equatable {
  final PageItem pageItem;
  final int index;
  const PageProviderState({
    required this.pageItem,
    required this.index,
  });

  // factory constructor for the initial state
  factory PageProviderState.initial() {
    return const PageProviderState(
      pageItem: PageItem.home,
      index: 0,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [pageItem, index];

  PageProviderState copyWith({
    PageItem? pageItem,
    int? index,
  }) {
    return PageProviderState(
      pageItem: pageItem ?? this.pageItem,
      index: index ?? this.index,
    );
  }
}
