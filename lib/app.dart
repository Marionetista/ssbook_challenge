import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'src/features/home/cubit/home_page_cubit.dart';
import 'src/features/home/home_page.dart';

class App extends StatelessWidget {
  App({super.key}) {
    final link = HttpLink(
      'https://us-central1-ss-devops.cloudfunctions.net/GraphQL',
    );

    client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }

  late final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) => GraphQLProvider(
        client: client,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SSBOOK',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocProvider<HomePageCubit>(
            create: (context) => HomePageCubit(client.value)..getBooks(),
            child: const HomePage(),
          ),
        ),
      );
}
