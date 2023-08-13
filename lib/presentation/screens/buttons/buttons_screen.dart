import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsVIew(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsVIew extends StatelessWidget {
  const _ButtonsVIew();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            spacing: 15,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Elevated button'),
                onPressed: () {},
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('Elevated disabled button'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.access_alarm_rounded),
                onPressed: () {},
                label: const Text('Elevated icon button'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled button'),
              ),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.accessibility_new),
                  label: const Text('Filled Icon')),
              OutlinedButton(
                  onPressed: () {}, child: const Text('Outlined button')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.terminal),
                  label: const Text('Outlined icon button')),
              TextButton(onPressed: () {}, child: const Text('Text button')),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_box_outlined),
                  label: const Text('Text icon button')),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.app_registration_rounded)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    iconColor: const MaterialStatePropertyAll(Colors.white)),
              ),
              const _CustomButton()
            ],
          )),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
