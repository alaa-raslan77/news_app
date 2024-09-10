import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/repo/home_local_ds_impl.dart';
import 'package:news_app/repo/home_remote_ds_impl.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/ui/tab_item.dart';
import '../main.dart';

class NewsUi extends StatefulWidget {
  String id;
  NewsUi({super.key, required this.id});

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          print(
              "===========================================================================");
          if (scrollController.offset != 0) {
            setState(() {
              HomeCubit.get(context).addNumPage(HomeCubit.get(context).page);
              scrollController.animateTo(0,
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut);
              print(
                  "${HomeCubit.get(context).page}===========================================");
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>
            HomeCubit(isConnected ? HomeRemoteDsImpl() : HomeLocalDsImpl())
              ..getSources(widget.id),
        child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
          if (state is HomeGetNewsDataLoadingState ||
              state is HomeGetSourcesLoadingState) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }

          if (state is HomeChangeSource) {
            HomeCubit.get(context).getNewsData(
                sourceID: HomeCubit.get(context)
                        .sourcesResponse
                        ?.sources?[HomeCubit.get(context).selectedTabIndex]
                        .id ??
                    '',
                pageSize: HomeCubit.get(context).pageSize,
                page: HomeCubit.get(context).page);
          }
        }, builder: (context, state) {
          final sources = HomeCubit.get(context).sourcesResponse?.sources;

          if (state is HomeGetNewsDataErrorState) {
            return Center(
              child: Text(
                "Something went wrong!",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            );
          }

          return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 0,
                      ),
                      DefaultTabController(
                        length: HomeCubit.get(context)
                                .sourcesResponse
                                ?.sources
                                ?.length ??
                            0,
                        child: TabBar(
                          onTap: (value) {
                            HomeCubit.get(context).changeSource(value);
                          },
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          tabs: HomeCubit.get(context)
                                  .sourcesResponse
                                  ?.sources
                                  ?.map((e) => TabItem(
                                        sources: e,
                                        isSelected: HomeCubit.get(context)
                                                .sourcesResponse
                                                ?.sources
                                                ?.elementAt(
                                                    HomeCubit.get(context)
                                                        .selectedTabIndex) ==
                                            e,
                                      ))
                                  .toList() ??
                              [],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return NewsItem(
                        article: HomeCubit.get(context).model!.articles![index],
                      );
                    },
                    itemCount:
                        HomeCubit.get(context).model?.articles?.length ?? 0,
                  ),
                )
              ]));
        }),
      ),
    );
  }
}
