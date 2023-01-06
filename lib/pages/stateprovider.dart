import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/widget/textwidget.dart';

final intState = StateProvider<int>((ref) => 0);
// final intState = StateProvider.autoDispose<int>((ref) => 0);
final boolState = StateProvider<bool>(((ref) => true));
//final boolState = StateProvider.autoDispose<bool>(((ref) => true));

class stateProvider extends StatelessWidget {
  const stateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
        appBar: AppBar(
          title: const Text("STATE PROVIDER"),
        ),
        body: Consumer(builder: ((context, ref, child) {
          final intvalue = ref.watch(intState);
          final display = intvalue.toString();
          final boolvalue = ref.watch(boolState);
          final display2 = boolvalue.toString();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(display: "$display\n$display2"),
              ElevatedButton.icon(
                  onPressed: () {
                    ref.read(intState.notifier).state++;
                    ref.read(boolState.notifier).state = !boolvalue;
                  },
                  icon: const Icon(Icons.change_circle),
                  label: const Text("Refresh"))
            ],
          );
        })));
  }
}

// class stateProvider extends ConsumerWidget {
//   const stateProvider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
    // final intvalue = ref.watch(intState);
    // final display = intvalue.toString();
    // final boolvalue = ref.watch(boolState);
    // final display2 = boolvalue.toString();
//     print("hello");
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("STATE PROVIDER"),
    //   ),
    //   body: TextWidget(display: "$display\n$display2"),
    //   floatingActionButton: FloatingActionButton(
    //       child: const Icon(Icons.change_circle),
    //       onPressed: () {
    //         ref.read(boolState.notifier).state = !boolvalue;
    //         ref.read(intState.notifier).state++;
    //       }),
    // );
//   }
// }
