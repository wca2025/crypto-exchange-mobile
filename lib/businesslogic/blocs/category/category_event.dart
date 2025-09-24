part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
   const factory CategoryEvent.fetchcategorylist() = _FetchCategoryListEvent;
  const factory CategoryEvent.fetchcategorybyid() = _FetchCategoryByIdEvent;
  const factory CategoryEvent.addcategory() = _AddCategoryEvent;
  const factory CategoryEvent.updatecategory()= _UpdateCategoryEvent;
  const factory CategoryEvent.deletecategory() = _DeleteCategoryEvent;

}