import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sepatwo/data/model/category_response_model/category.dart';
import 'package:sepatwo/domain/repository/category_repository.dart';
import 'package:sepatwo/data/repository/category_respository_impl.dart';
import 'package:sepatwo/data/datasource/category/category_remote_datasource.dart';
import 'package:sepatwo/core/network/dio_client.dart';

final categoryProvider = StateNotifierProvider<CategoryProvider, CategoryState>(
  (ref) {
    final datasource = CategoryRemoteDatasourceImpl(DioClient.dio);
    final repository = CategoryRepositoryImpl(datasource);
    return CategoryProvider(repository);
  },
);

sealed class CategoryState {
  const CategoryState();

  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.loaded(List<Category> categories) =
      CategoryLoaded;
  const factory CategoryState.error(String message) = CategoryError;

  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Category> categories) loaded,
    required T Function(String message) error,
  }) {
    final state = this;
    if (state is CategoryInitial) {
      return initial();
    } else if (state is CategoryLoading) {
      return loading();
    } else if (state is CategoryLoaded) {
      return loaded(state.categories);
    } else if (state is CategoryError) {
      return error(state.message);
    }
    throw Exception('Unknown CategoryState');
  }
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  const CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
}

class CategoryProvider extends StateNotifier<CategoryState> {
  final CategoryRepository _categoryService;
  CategoryProvider(this._categoryService)
    : super(const CategoryState.initial());

  Future<void> getCategories() async {
    state = const CategoryState.loading();
    try {
      final categories = await _categoryService.getCategories();
      categories.fold(
        (left) {
          state = CategoryState.error(left.toString());
        },
        (right) {
          state = CategoryState.loaded(right.data ?? []);
        },
      );
    } catch (e) {
      state = CategoryState.error(e.toString());
    }
  }
}
