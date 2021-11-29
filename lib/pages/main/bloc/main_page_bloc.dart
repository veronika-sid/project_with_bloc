import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_with_bloc/models/users.dart';
import 'package:project_with_bloc/repository/product_repository.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final IProductRepository productRepository;
  MainPageBloc({required this.productRepository}) : super(MainPageInitial()) {
    on<MainPageEvent>((event, emit) async {
      if (event is OpenDataEvent) {
        emit(SendingDataState());
        await Future.delayed(const Duration(seconds: 3));
        final data = await productRepository.getProducts();
        if (data != null) {
          emit(OpenDataState(users: data));
        } else {
          emit(ErrorDataState(statusCode: productRepository.getStatusCode().toString()));
        }
      }
    });
  }
}
