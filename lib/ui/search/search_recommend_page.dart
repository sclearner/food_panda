import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/search_appbar_cubit/search_appbar_cubit.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/repositories/search_repo.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';

class SearchRecommendPage extends StatelessWidget {
  const SearchRecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("RECENT SEARCH",
                  style: context.textTheme.headlineSmall
                      ?.copyWith(color: context.colorScheme.shadow)),
              FutureBuilder(
                  future: context.read<SearchRepo>().getSearchHistory(5),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return CircularProgressIndicator();
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.requireData
                          .map((e) => InkWell(
                              onTap: () async {
                                final bloc = context.read<SearchBloc>();
                                bloc.add(SearchEditingKeyword(e));
                                bloc.add(SearchRequest());
                                await Future.delayed(100.ms);
                                if (context.mounted)
                                  context.read<SearchAppbarCubit>().submit();
                              },
                              child: Text(
                                e,
                                style: context.textTheme.headlineSmall
                                    ?.copyWith(height: 7 / 4),
                              )))
                          .toList(),
                    );
                  }),
              Text("RECOMMENDED FOR YOU",
                  style: context.textTheme.headlineSmall
                      ?.copyWith(color: context.colorScheme.shadow, height: 2)),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: FlutterLogo(),
                      ),
                      ProductDetail(),
                    ],
                  ),
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: 3)
            ],
          ),
        ),
      ),
    );
  }
}
