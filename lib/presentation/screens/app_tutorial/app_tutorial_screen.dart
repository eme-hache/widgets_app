import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(this.title, this.caption, this.imageUrl);
}

const List<SlideInfo> slides = [
  SlideInfo(
      'Busca la comida',
      'Id nisi tempor enim commodo Lorem in ut cupidatat reprehenderit elit minim.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Incididunt nulla aute laboris ullamco deserunt consequat nisi irure ipsum do Lorem deserunt nisi.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Veniam quis dolor sunt enim reprehenderit ipsum minim reprehenderit incididunt.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController;
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController()
      ..addListener(() {
        final page = pageViewController.page ?? 0;

        if (!endReached && page >= (slides.length - 1.5)) {
          setState(() {
            endReached = true;
          });
        }
      });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: [
                ...slides.map((slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
              ],
            ),
            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  child: const Text('Salir'), onPressed: () => context.pop()),
            ),
            endReached
                ? Positioned(
                    right: 30,
                    bottom: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 500),
                      child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar'),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 20),
              Text(caption, style: captionStyle)
            ],
          ),
        ));
  }
}
