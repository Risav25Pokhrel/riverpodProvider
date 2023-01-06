import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/widget/textwidget.dart';

Future<String> fetchmydata(String name) async {
  await Future.delayed(const Duration(seconds: 3));
  return name == "real"
      ? "https://scitechdaily.com/images/Gravitational-Waves.gif"
      : "https://i.pinimg.com/originals/b0/d4/4f/b0d44fdffaef5080b2a682ab6485a0ac.gif";
}

final dataprovider = Provider<String>(((ref) => "real"));

final futureprovider = FutureProvider<String>(((ref) {
  final name = ref.watch(dataprovider);
  return fetchmydata(name);
}));

class Combinedprovider extends StatelessWidget {
  const Combinedprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COMBINED PROVIDER"),
      ),
      body: Consumer(builder: ((context, ref, child) {
        final photourl = ref.watch(futureprovider);
        return photourl.when(
          error: ((error, stackTrace) =>
              const TextWidget(display: "Error occur")),
          loading: (() => const Center(
                child: CircularProgressIndicator(),
              )),
          data: ((data) => Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(data),
                ),
              )),
        );
      })),
    );
  }
}
