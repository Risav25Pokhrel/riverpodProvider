import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/widget/textwidget.dart';

final streamProvider =
    StreamProvider.autoDispose<String>(((ref) => Stream.periodic(
          const Duration(seconds: 1),
          ((computationCount) => "$computationCount"),
        )));

class Streamprovider extends StatelessWidget {
  const Streamprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STREAM PROVIDER"),
      ),
      body: Consumer(builder: ((context, ref, child) {
        final stream = ref.watch(streamProvider);
        return stream.when(
            data: ((data) => TextWidget(display: data)),
            error: ((error, stackTrace) => const TextWidget(display: "ERROR")),
            loading: (() => const Center(
                  child: CircularProgressIndicator(),
                )));
      })),
    );
  }
}
// final streamProvider =
//     StreamProvider<String>(((ref) => Stream.periodic(
//           const Duration(seconds: 1),
//           ((computationCount) => "$computationCount"),
//         )));

// class Streamprovider extends ConsumerWidget {
//   const Streamprovider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final stream = ref.watch(streamProvider.stream);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("STREAM PROVIDER"),
//       ),
      // body: StreamBuilder<String>(
      //   stream: stream,
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );

      //       default:
      //         if (snapshot.hasError) {
      //           return const TextWidget(display: "Error");
      //         } else {
      //           final Counter = snapshot.data;
      //           return Center(child: TextWidget(display: Counter.toString()));
      //         }
      //     }
      //   },
      // ),
//     );
//   }
// }
