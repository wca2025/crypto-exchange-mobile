part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
    const factory CategoryState.initial() = _InitialCategoryState;
    const factory CategoryState.loading() = _LoadingCategoryState;
  const factory CategoryState.error() = _ErrorCategoryState;
  const factory CategoryState.success() = _SuccesCategoryState;
const factory CategoryState.displaycategory()=_DisplayCategoryState;
const factory CategoryState.displayspecificcategory()=_DisplaySpecificCategoryState;


}


