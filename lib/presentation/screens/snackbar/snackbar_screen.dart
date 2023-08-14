import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Ok',
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Estás seguro?'),
              content: const Text(
                  'Nulla dolore cillum laboris ex eu mollit exercitation nostrud adipisicing sint nostrud incididunt in. Laboris exercitation est proident anim nulla id nostrud qui sit proident deserunt veniam. Exercitation nulla cillum cupidatat quis velit duis ut cillum dolore ut ut. Sit magna ea dolore voluptate. Nisi proident duis sint aliqua labore laboris laborum sit reprehenderit tempor sit reprehenderit irure. Consectetur ullamco ipsum consequat ipsum tempor exercitation magna.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Est nulla consectetur exercitation nulla irure commodo. Exercitation quis dolore nostrud non dolore sint laborum dolor nisi dolore magna. Reprehenderit laboris pariatur dolore quis duis proident sit non elit. Eiusmod reprehenderit incididunt ut sit nisi et ullamco velit consequat occaecat ullamco. Pariatur consequat magna Lorem cillum ea elit magna eu. Voluptate elit enim irure excepteur incididunt esse nostrud aliquip duis do sit nisi deserunt.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo')),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
