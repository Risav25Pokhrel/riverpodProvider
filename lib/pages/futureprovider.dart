import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchdata() async {
  await Future.delayed(const Duration(seconds: 3));
  return "https://scitechdaily.com/images/Gravitational-Waves.gif";
}

final futureProvider = FutureProvider<String>(((ref) => fetchdata()));

// final futureProvider = FutureProvider.autoDispose<String>(((ref) => fetchdata()));
class Futureprovider extends StatelessWidget {
  const Futureprovider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FUTURE PROVIDER"),
      ),
      body: Consumer(builder: ((context, ref, child) {
        final future = ref.watch(futureProvider);
        return future.when(
            data: ((data) => Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      data,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            error: ((error, stackTrace) => const Text("AN ERROR OCCUR")),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      })),
    );
  }
}
// class Futureprovider extends ConsumerWidget {
//   const Futureprovider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final future = ref.watch(futureProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Future Provider"),
//       ),
//       body: future.when(
//         error: ((error, stackTrace) => const Text("AN ERROR OCCUR")),
//         loading: (() => const Center(
//               child: CircularProgressIndicator(),
//             )),
        // data: ((data) => Center(
        //       child: SizedBox(
        //         height: 200,
        //         width: 200,
        //         child: Image.network(
        //           data,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     )),
//       ),
//     );
//   }
// }
