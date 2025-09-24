import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
  import 'package:flutter/foundation.dart';
part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {


CategoryBloc() : super(CategoryState.initial()) {
   List<Category> categories = [];
 
    on<_FetchCategoryListEvent>((event, emit) async {
      // categories = await CategoryRepo.readAllCategories();
      // emit(_DisplayCategoryState(category: categories));
    });

    on<_FetchCategoryByIdEvent>((event, emit) async {
      // Category category = await CategoryRepo.readCategory(id: event.id);
      // emit(_DisplaySpecificCategoryState(category: category));
    });

   
  }
}
