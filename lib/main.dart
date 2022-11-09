import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope( child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Example2());
  }
}

class Example2 extends ConsumerWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Increment')),
            const SizedBox(
              height: 40,
            ),
            Consumer(builder: (context, ref, child) {
              final count = ref.watch(counterProvider);
              return Text(count ==null ? 'Press the button' : count.toString());
            }),
          ],
        ),
      ),
    );
  }
}

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increment() => state = state == null ? 0 : state! + 1;
  int? get value => state;
}
final counterProvider =
    StateNotifierProvider<Counter, int?>((ref) => Counter());
