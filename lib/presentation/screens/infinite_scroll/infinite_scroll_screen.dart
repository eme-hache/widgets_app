import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;

    super.dispose();
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;

    setState(() {
      addFiveImages();
      isLoading = false;
    });

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 3));

    isLoading = false;

    if (!isMounted) return;

    setState(() {
      final lastId = imagesIds.last;

      imagesIds
        ..clear()
        ..add(lastId + 1);

      addFiveImages();
    });
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoading
              ? SpinPerfect(
                  infinite: isLoading, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: MediaQuery.removePadding(
          removeBottom: true,
          removeTop: true,
          context: context,
          child: RefreshIndicator(
            edgeOffset: 20,
            strokeWidth: 2,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                );
              },
            ),
          ),
        ));
  }
}
