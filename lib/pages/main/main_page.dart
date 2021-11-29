import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_with_bloc/managers/api_manager.dart';
import 'package:project_with_bloc/repository/product_repository.dart';
import 'package:project_with_bloc/scalable_size/scalable_size.dart';

import 'bloc/main_page_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageBloc _bloc;

  @override
  void initState() {
    _bloc = MainPageBloc(productRepository: ProductRepository(apiManager: ApiManager()));
    _bloc.add(OpenDataEvent());
    _bloc.stream.listen((state) {
      print(state);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<MainPageBloc, MainPageState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is SendingDataState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is OpenDataState) {
              return ListView.builder(
                  itemCount: state.getUsers().length,
                  itemBuilder:(BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(context.getScalableHeight(5)),
                    child: Padding(
                      padding: EdgeInsets.all(context.getScalableHeight(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title: ${state.getUsers()[index].title}'),
                          Text('Body: ${state.getUsers()[index].body}'),
                        ],),
                    ),
                 );
              });
            } else if(state is ErrorDataState) {
              return Center(child: Text('Error. Status code: ${state.getStatusCode()}'),);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
