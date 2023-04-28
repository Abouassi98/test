import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/color_provider.dart';

class TestTask extends HookConsumerWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(randomColorProvider);
    final void Function(ColorConvertType)? onSelected =
        useMemoized(() => (ColorConvertType value) {
              switch (value) {
                case ColorConvertType.hexadecimal:
                  ref
                      .watch(colorTypeProvider.notifier)
                      .update((_) => ColorConvertType.hexadecimal);
                  break;
                case ColorConvertType.rgb:
                  ref
                      .watch(colorTypeProvider.notifier)
                      .update((_) => ColorConvertType.rgb);
                  break;
              }
            });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor == const Color.fromRGBO(255, 255, 255, 1)
            ? Colors.red
            : Colors.white,
        title: const Text('Randome Color Tap'),
        actions: [
          PopupMenuButton(
            constraints: const BoxConstraints(
              maxWidth: 70,
            ),
            color: myColor.withOpacity(.75),
            icon: const Icon(Icons.colorize),
            padding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) {
              return <PopupMenuEntry<ColorConvertType>>[
                const PopupMenuItem(
                    value: ColorConvertType.hexadecimal,
                    child: Text(
                      'HEX',
                      style: TextStyle(color: Colors.black),
                    )),
                const PopupMenuItem(
                  value: ColorConvertType.rgb,
                  child: Text('RGB', style: TextStyle(color: Colors.black)),
                )
              ];
            },
            onSelected: onSelected,
          )
        ],
      ),
      body: GestureDetector(
        onLongPress: () {
          Clipboard.setData(
            ClipboardData(
              text: ref.read(colorTypeProvider) == ColorConvertType.hexadecimal
                  ? ref.watch(getHexaColorProvider)
                  : ref.watch(getRGBColorProvider),
            ),
          );
          // displayed snackbar if run on web or desktop
          if (defaultTargetPlatform != TargetPlatform.android &&
              defaultTargetPlatform != TargetPlatform.iOS) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Copied to Clipboard'),
              ),
            );
          }
        },
        onTap: () => ref.read(randomColorProvider.notifier).changeColor(),
        child: AnimatedContainer(
          decoration: BoxDecoration(color: myColor),
          duration: const Duration(milliseconds: 300),
          child: const Center(
            child: Text(
              'Random Color Tap Test',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButton: Text(myColor.toString(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
