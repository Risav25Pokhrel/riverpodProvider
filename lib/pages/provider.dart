import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/widget/textwidget.dart';

final numberProvider = Provider.autoDispose<int>((ref) => 20);
final stringProvider = Provider<String>((ref) => "Hello Nepal World");

class Providerpage extends ConsumerWidget {
  const Providerpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider).toString();
    final output = ref.watch(stringProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: TextWidget(display: number + output),
    );
  }
}


//consumerwidget rebuild all the state from appbar to body
//but using consumer rebuild only the widget of consumer not 
//appbar hence performance benifit


// class Providerpage extends StatelessWidget {
//   const Providerpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Provider"),
      // ),
//       body: Consumer(builder: ((context, ref, child) {
//         final number = ref.watch(numberProvider).toString();
//         final output = ref.watch(stringProvider);
//         return TextWidget(display: "$number\n$output");
//       })),
//     );
//   }
// }
